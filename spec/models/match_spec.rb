require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Match do

  it "should create a new instance given valid attributes" do
    Match.generate.should be_valid
  end


end

#dean_vs_maria:
#  active: 1

#unstarted_match:
#  name: Unstarted
#  active: 1

#castled:
#  name: Castled Kings Pawn Game
#  active: 1

#resigned:
#  active: 0
#  result: Resigned
#  winning_player: 3
#
#e4: # a FEN notated match after 1. e4
#  start_pos: RNBQKBNR/PPPP1PPP/8/4P3/8/8/pppppppp/rnbqkbnr b

#legal:
#  name: Legal vs. St. Brie, 1750

#immortal:
#  name: The Immortal Match (Anderssen vs. Kieseritzky, 1851)
