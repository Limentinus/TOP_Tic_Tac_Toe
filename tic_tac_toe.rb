# frozen_string_literal: true

# Runs the TicTacToe Game
class TicTacToe
  LINES = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 4, 8], [2, 4, 6]]

  def initialize(player1, player2)
    @squares = Array.new(9, ' ')
    @game_over = false
    @player1 = Player.new(self, "X")
    @player2 = Player.new(self, "O")
  end

  private

  def print_board
    puts "#{@squares[6]} | #{@squares[7]} | #{@squares[8]}
        \n#{@squares[3]} | #{@squares[4]} | #{@squares[5]}
        \n#{@squares[0]} | #{@squares[1]} | #{@squares[2]}"
  end

  def player_input(mark)
    puts "Put your #{mark} on one of the squares. Input a number between 1 and 9. The numbers on the num pad represent the squares"
    @squares[gets.chomp.to_i - 1] = mark.to_s
    print_board
  end

  def won?(mark)
    LINES.any? do |line|
      line.all? { |position| @squares[position] == mark }
    end
  end

  def board_full?
    @squares.none?(' ')
  end

  public

  def play_game
    player = 'X'
    while @game_over == false
      puts "The player is #{player}"
      player_input(player)
      if won?(player)
        puts "#{player} has won"
        @game_over = true
      elsif board_full?
        puts 'Its a tie'
        @game_over = true
      end
      
      if player == 'X'
        player = 'O'
      elsif player == 'O'
        player = 'X'
      end

    end
  end
end

class Player
  def initialize(game, marker)
    @game = game
    @marker = marker
  end
  attr_reader :marker
end


game = TicTacToe.new
game.play_game
