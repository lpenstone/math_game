require './start'

class Question
  attr_accessor :player, :value1, :value2, :correct_answer, :given_answer

  def initialize(player, player1, player2, value1 = 1 + rand(20), value2 = 1 + rand(20))
    @player = player
    @player1 = player1
    @player2 = player2
    @value1 = value1
    @value2 = value2
    ask_question
    check_answer
  end

  def ask_question
    puts "---------- NEW TURN -----------"
    puts "#{@player.name}: what does #{@value1} plus #{@value2} equal?"
    print "> "
    @given_answer = $stdin.gets.chomp.to_i
  end

  def check_answer
    if @given_answer == @value1 + @value2
      puts "Good job!"
      display_score
    else
      puts "Wrong!"
      remove_point(@player)
      display_score
    end
  end

  def display_score
    puts "P1: #{@player1.points}/3 | P2:#{@player2.points}/3"
  end

  def remove_point(player)
    @player.points = @player.points - 1
  end
end