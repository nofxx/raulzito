####### helper functions #########

# An alternate syntax is to 'opening' up the class is to define a module and then
# Object.send(:include, MyCoolModule)

class Object
  # convenience syntax
  def with(arg)
    yield arg
  end

  def try(meth, *args)
    self.send(meth, *args) if self.respond_to?(meth)
  end
end

#for ruby < 1.9 to use ruby 1.9 each_char unicode safe syntax
class String
  def each_char
    (0..self.length-1).each { |place| yield self[place..place] }
  end
  def rank
    self[1..1].to_i
  end
  def file
    self[0..0]
  end

  # Lets you do d2 - d1 and get [0, -1]
  def - other
    [ self[0] - other[0], self[1] - other[1] ]
  end

  # Lets you do d1 ^ [0, 1] and get d2
  def ^ vector
    file, rank = (self[0]+vector[0]).chr, (self[1]+vector[1]).chr
    "#{file}#{rank}"
  end
end

class Symbol
  def rank; self.to_s.rank ; end
  def file; self.to_s.file ; end
end

class Fixnum
  def sign; self == 0 ? 0 : self < 0 ? -1 : 1 ; end
end

class Array
    # the basis vector - [1,1] for [n, n] [-1, 0] for [-n, 0]
  def basis
    self.map{|comp| comp.sign }
  end

  # for [3,0] yields [1,0], [2,0], and [3,0] in succession
  # for [2,2] yields [1,1], and [2,2] in succession
  def walk
    1.upto( self.map(&:abs).max ) do |mult|
      yield [ basis[0] * mult, basis[1] * mult ]
    end
  end

end


