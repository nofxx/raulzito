raise "To avoid rake task loading problems: run 'rake clobber' in vendor/plugins/rspec" if File.directory?(File.join(File.dirname(__FILE__), *%w[.. .. vendor plugins rspec pkg]))
raise "To avoid rake task loading problems: run 'rake clobber' in vendor/plugins/rspec-rails" if File.directory?(File.join(File.dirname(__FILE__), *%w[.. .. vendor plugins rspec-rails pkg]))

# In rails 1.2, plugins aren't available in the path until they're loaded.
# Check to see if the rspec plugin is installed first and require
# it if it is.  If not, use the gem version.
rspec_base = File.expand_path(File.dirname(__FILE__) + '/../../vendor/plugins/rspec/lib')
$LOAD_PATH.unshift(rspec_base) if File.exist?(rspec_base)
require 'spec/rake/spectask'

spec_prereq = File.exist?(File.join(RAILS_ROOT, 'config', 'database.yml')) ? "db:test:prepare" : :noop
task :noop do
end

task :default => :spec
task :stats => "spec:statsetup"

desc "Run all specs in spec directory (excluding plugin specs)"
Spec::Rake::SpecTask.new(:spec => spec_prereq) do |t|
  t.spec_opts = ['--options', "\"#{RAILS_ROOT}/spec/spec.opts\""]
  t.spec_files = FileList['spec/**/*_spec.rb']
end

# BEGIN HACK to allow daisy-chaining of rake tasks - eg supplement rake test
# with your own functionality, adapted from http://preview.tinyurl.com/cjbwxz
Rake::TaskManager.class_eval do
  def delete_task(task_name)
    @tasks.delete(task_name.to_s)
  end
  def get_task(task_name)
    @tasks[task_name.to_s]
  end
end
  
#run_test_unit, run_rspec = [Rake.application.delete_task("test"), Rake.application.get_task("spec")]
  
#task :test do
#  run_test_unit.invoke
#  puts "IM IN YOUR rake test, runnin your RSPEC!"
#  run_rspec.invoke
#end
# END HACK

namespace :spec do
  desc "Run all specs in spec directory with RCov (excluding plugin specs)"
  Spec::Rake::SpecTask.new(:rcov) do |t|
    #t.spec_opts = ['--options', "\"#{RAILS_ROOT}/spec/spec.opts\""]

    t.spec_files = FileList['spec/**/*_spec.rb']
    #t.spec_files = FileList['test/**/*_test.rb']

    t.rcov = true
    t.rcov_opts = lambda do
      IO.readlines("#{RAILS_ROOT}/spec/rcov.opts").map {|l| l.chomp.split " "}.flatten
    end
  end
  
  desc "Print Specdoc for all specs (excluding plugin specs)"
  Spec::Rake::SpecTask.new(:doc) do |t|
    t.spec_opts = ["--format", "specdoc", "--dry-run"]
    t.spec_files = FileList['spec/**/*_spec.rb']
  end

  desc "Print Specdoc for all plugin specs"
  Spec::Rake::SpecTask.new(:plugin_doc) do |t|
    t.spec_opts = ["--format", "specdoc", "--dry-run"]
    t.spec_files = FileList['vendor/plugins/**/spec/**/*_spec.rb'].exclude('vendor/plugins/rspec/*')
  end

  [:models, :controllers, :views, :helpers, :lib].each do |sub|
    desc "Run the specs under spec/#{sub}"
    Spec::Rake::SpecTask.new(sub => spec_prereq) do |t|
      t.spec_opts = ['--options', "\"#{RAILS_ROOT}/spec/spec.opts\""]
      t.spec_files = FileList["spec/#{sub}/**/*_spec.rb"]
    end
  end
  
  desc "Run the specs under vendor/plugins (except RSpec's own)"
  Spec::Rake::SpecTask.new(:plugins => spec_prereq) do |t|
    t.spec_opts = ['--options', "\"#{RAILS_ROOT}/spec/spec.opts\""]
    t.spec_files = FileList['vendor/plugins/**/spec/**/*_spec.rb'].exclude('vendor/plugins/rspec/*').exclude("vendor/plugins/rspec-rails/*")
  end
  
  namespace :plugins do
    desc "Runs the examples for rspec_on_rails"
    Spec::Rake::SpecTask.new(:rspec_on_rails) do |t|
      t.spec_opts = ['--options', "\"#{RAILS_ROOT}/spec/spec.opts\""]
      t.spec_files = FileList['vendor/plugins/rspec-rails/spec/**/*_spec.rb']
    end
  end

  # Setup specs for stats
  task :statsetup do
    require 'code_statistics'
    ::STATS_DIRECTORIES << %w(Model\ specs spec/models) if File.exist?('spec/models')
    ::STATS_DIRECTORIES << %w(View\ specs spec/views) if File.exist?('spec/views')
    ::STATS_DIRECTORIES << %w(Controller\ specs spec/controllers) if File.exist?('spec/controllers')
    ::STATS_DIRECTORIES << %w(Helper\ specs spec/helpers) if File.exist?('spec/helpers')
    ::STATS_DIRECTORIES << %w(Library\ specs spec/lib) if File.exist?('spec/lib')
    ::CodeStatistics::TEST_TYPES << "Model specs" if File.exist?('spec/models')
    ::CodeStatistics::TEST_TYPES << "View specs" if File.exist?('spec/views')
    ::CodeStatistics::TEST_TYPES << "Controller specs" if File.exist?('spec/controllers')
    ::CodeStatistics::TEST_TYPES << "Helper specs" if File.exist?('spec/helpers')

    #We're not counting library files which add 'plugin' like functionality only (FEN, etc)
    ::STATS_DIRECTORIES.reject!{ |elem| elem[0].include? "Librar" }
    # ::CodeStatistics::TEST_TYPES << "Library specs" if File.exist?('spec/lib')

    # ::STATS_DIRECTORIES.delete_if {|a| a[0] =~ /test/}
  end

  namespace :db do
    namespace :fixtures do
      desc "Load fixtures (from spec/fixtures) into the current environment's database.  Load specific fixtures using FIXTURES=x,y"
      task :load => :environment do
        require 'active_record/fixtures'
        ActiveRecord::Base.establish_connection(RAILS_ENV.to_sym)
        (ENV['FIXTURES'] ? ENV['FIXTURES'].split(/,/) : Dir.glob(File.join(RAILS_ROOT, 'spec', 'fixtures', '*.{yml,csv}'))).each do |fixture_file|
          Fixtures.create_fixtures('spec/fixtures', File.basename(fixture_file, '.*'))
        end
      end
    end
  end


  namespace :server do
    daemonized_server_pid = File.expand_path("spec_server.pid", RAILS_ROOT + "/tmp")

    desc "start spec_server."
    task :start do
      # see if we have an orphaned pid file due (pid, but no process running)
      # not MS Windows-safe
      really_running = (`ps -ef | grep -e "ruby.*spec_server" | grep -v grep` != "")
      pidfile_exists = File.exist?(daemonized_server_pid)

      if pidfile_exists and really_running
        $stderr.puts "spec_server is already running." and return
      end

      if pidfile_exists and ! really_running
          puts 'deleting orphaned pid' and File.delete(daemonized_server_pid)
      end

      $stderr.puts "Starting up spec server."
      system("ruby", "script/spec_server", "--daemon", "--pid", daemonized_server_pid)
    end

    desc "stop spec_server."
    task :stop do
      unless File.exist?(daemonized_server_pid)
        $stderr.puts "No server running."
      else
        $stderr.puts "Shutting down spec_server."
        system("kill", "-s", "TERM", File.read(daemonized_server_pid).strip) && 
        File.delete(daemonized_server_pid)
      end
    end

    desc "reload spec_server."
    task :restart do
      unless File.exist?(daemonized_server_pid)
        $stderr.puts "No server running."
      else
        $stderr.puts "Reloading down spec_server."
        system("kill", "-s", "USR2", File.read(daemonized_server_pid).strip)
      end
    end
  end
end
