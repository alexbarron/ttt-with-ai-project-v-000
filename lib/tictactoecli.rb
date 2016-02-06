class TicTacToeCli

  def self.start
    puts "Welcome to Tic Tac Toe!"
    print "Do you want to play normal or wargames? "
    type = gets.chomp
    if type == "normal"
      game = get_human_count
      puts "Let's begin! X goes first!"
      game.play
    elsif type == "wargames"
      wargames
    else
      puts "Try again"
      start
    end
  end

  def self.wargames
    results = {x_wins: 0, o_wins: 0, ties: 0}
    100.times do
      game = Game.new(Player::Computer.new("X"), Player::Computer.new("O"))
      result = game.play
      if result == "tie"
        results[:ties] += 1
      elsif result == "X"
        results[:x_wins] += 1
      elsif result == "Y"
        results[:o_wins]
      end
    end
    puts "#{results[:ties]} ties"
    puts "#{results[:x_wins]} wins for X"
    puts "#{results[:o_wins]} wins for O"
  end

  def self.get_human_count
    print "How many human players do you want to play with? Enter 0, 1, or 2: "
    humans = gets.chomp
    if humans == "0"
      return Game.new(Player::Computer.new("X"), Player::Computer.new("O"))
    elsif humans == "1"
      return human_or_computer_first
    elsif humans == "2"
      return Game.new
    else
      puts "Try again."
      get_human_count
    end
  end

  def self.human_or_computer_first
    print "Who should go first? Enter human or computer: "
    response = gets.chomp
    if response == "human"
      return Game.new(Player::Human.new("X"), Player::Computer.new("O"))
    elsif response == "computer"
      return Game.new(Player::Computer.new("X"), Player::Human.new("O"))
    else
      puts "Try again"
      human_or_computer_first
    end
  end
end