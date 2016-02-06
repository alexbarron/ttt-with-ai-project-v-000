class Board

  attr_accessor :cells

  def initialize
    self.reset!
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(pos)
    return @cells[pos.to_i-1]
  end

  def full?
    @cells.all? {|cell| cell != " "}
  end

  def turn_count
    @cells.count {|cell| cell == "O" || cell == "X"}
  end

  def taken?(pos)
    @cells[pos.to_i-1] != " "
  end

  def valid_move?(pos)
    pos = pos.to_i
    if pos.between?(1,9) && !taken?(pos)
      return true
    else
      return false
    end
  end

  def update(pos, player)
    @cells[pos.to_i-1] = player.token
  end

end