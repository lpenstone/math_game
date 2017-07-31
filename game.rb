require './start'

class Game
  attr_accessor :current_player

  def initialize
    start_game
    @current_player = @player1
    loop do
      Question.new(@current_player, @player1, @player2)
      next_player
    break if @player1.points == 0 or @player2.points == 0
    end
    game_over(@current_player)
  end

  def start_game
    puts "Player 1: what is your name?"
    print "> "
    player1_name = $stdin.gets.chomp
    @player1 = Player.new(player1_name)
    puts "Player 2: what is your name?"
    print "> "
    player2_name = $stdin.gets.chomp
    @player2 = Player.new(player2_name)
  end

  def game_over(player)
    puts "--------- GAME OVER! ----------"
    puts announce_winner(player)
  end

  def next_player
    if @current_player == @player1
      @current_player = @player2
    else
      @current_player = @player1
    end
  end

  def announce_winner(player)
    "The winner is #{player.name}!"
  end

end




