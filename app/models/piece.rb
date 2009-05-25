# The base class of all pieces - contains behaviors common to all pieces
class Piece  

  # the side - eg white or black
  attr_accessor :side 

  # the role, or 'function' performed, or type of piece - eg pawn, knight, queen
  attr_accessor :function


  # for pieces like 'pawn' which there are many instances of, the discriminator
  # distinguishes each instance - eg a pawn, queens knight
  attr_accessor :discriminator # eg queens, kings, promoted, a, b (for pawns)
  
  # a class configures its chess behavior by invoking these class methods,
  # allowing piece instances to answer ask their class whether their move
  # vectors allow them to make a given move.
  class << self
    # the vectors a piece is allowed to move in, eg [1,0],[0,1]
    attr_accessor :move_vectors

    # boolean, true if instances can move until blocked, ie false for pawns
    attr_accessor :moves_unlimited
  end

  # Allows a subclass to declare its moves
  # These are stored in instance variables on the class invoking this
  #   move_directions :straight, :limit => none
  # will store [1,0],[-1,0],[0,1],[0,-1] in the class instance variable 
  # @move_vectors and true into @moves_unlimited
  # http://martinfowler.com/bliki/ClassInstanceVariable.html
  def self.move_directions(*args)
    @move_vectors = args.include?(:straight) ? [[1,0],[-1,0],[0,1],[0,-1]] : []
    @move_vectors.concat( [[1,1],[-1,1],[1,-1],[-1,-1]] ) if args.include?(:diagonal)
    @moves_unlimited = args.last[:limit]==:none
  end

  def initialize(side, function, discriminator=nil)
    @side, @function, @discriminator = side, function, discriminator
  end

  # without respect to any other pieces, can the piece move the given vector
  # (length and direction) from that place
  def self.allowed_move?(vector, starting_rank = nil)
    return false if vector == [0,0] #cant move to self
    return move_vectors.include?(vector) unless moves_unlimited

    # A possible optimization ? 
    # likely_vector = move_vectors.detect do |mv| 
    #  (vector[0] == 0 && mv[0] == 0 ) || 
    #  (vector[1] == 0 && mv[1] == 0) ||
    #  (vector[0] / mv[0] == vector[1] / mv[1])
    # end
    # return likely_vector != nil

    move_vectors.each do |dir|
      1.upto(8).each do |multiple|
        return true if vector == [ dir[0]*multiple, dir[1]*multiple ]
      end
    end
    return false
  end

  
  # gives instances access to the class method, but allow child classes to override
  def allowed_move?(vector, starting_rank=nil)
    self.class.allowed_move?(vector, starting_rank)
  end

  @moves_cache ||= {}

  # The set of squares on the board for which this piece answers allowed_move? == true
  def allowed_moves(board)
    # return @moves_cache[board] if @moves_cache[board]
    moves = []

    mypos = board.index(self) 
    board.each_square do |sq|
      moves << sq.to_sym if allowed_move?( sq - mypos, mypos.rank ) && !obstructed?( board, mypos, sq - mypos )
    end
    #@moves_cache[board] = moves

    moves
  end

  # Answers "Am I forbidden to move from [mypos] to the position specified by [vector], on this board" ?
  # Returns yes when blocked by your own piece, etc..
  # - No piece can obstruct a knight move
  # - A pawns sideways move is obstructed by space or his own side
  #   - Except when en passant capture is allowed
  # - We walk along a piece's attack-line looking for obstructions
  # - If you hit a piece along the attack-line, but not at the end, you're blocked
  # - At the end of the attack-line, you're blocked only if by your own piece
  def obstructed?( board, mypos, vector )

    return false if @function==:knight

    if @function==:pawn && vector[0] != 0 
      dest_piece = board[ mypos ^ vector ]
      return false if (mypos ^ vector)==board.en_passant_square
      return true  unless dest_piece && dest_piece.side != self.side
    end

    vector.walk do |step|
      if dest_piece = board[ mypos ^ step ]
        return step != vector || dest_piece.side == self.side
      end
    end
    
    return false
  end


  # the first character of the side: w or b
  def s; @side.to_s[0,1]; end

  # the first character of the discriminator, or ''
  def d; @discriminator ? @discriminator.to_s[0,1] : '' end

  # the first, lower-case character of the function - p q, etc
  def f; @function.to_s; end

  # when rendered the client id uniquely specifies an individual piece within a board
  # example: f_pawn_w
  def board_id
    dtag = @discriminator ? @discriminator.to_s[0,1]+'_':''
    "#{dtag}#{self.img_name}"
  end

  # a combination of the function (role) and side
  def img_name
    "#{@function}_#{@side.to_s[0,1]}"
  end
    
  def to_json(*args)
    %q(["%s","%s","%s"]) % [self.s, self.d, self.f]
  end

  # for FEN like situations
  def abbrev
    letter = case @function 
      when :pawn then 'p' 
      when :knight then 'n'
      else @function.to_s[0,1]
    end
    return letter.send( @side==:white ? :upcase : :downcase )
  end

end

