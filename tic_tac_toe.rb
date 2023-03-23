# frozen_string_literal: true

# Runs the TicTacToe Game
class TicTacToe
  LINES = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 4, 8], [2, 4, 6]].freeze

  def initialize
    @squares = Array.new(9, ' ')
    @current_player = 'X'
  end

  

  def print_board
    puts "#{@squares[6]} | #{@squares[7]} | #{@squares[8]}
        \n#{@squares[3]} | #{@squares[4]} | #{@squares[5]}
        \n#{@squares[0]} | #{@squares[1]} | #{@squares[2]}"
  end

  def player_input(mark)
    puts "Place your #{mark}. The numbers on the num pad represent the squares"
    input = (gets.chomp.to_i - 1)
    unless square_full?(input)
      @squares[input] = mark.to_s
    end
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

  def switch_player(player)
    case player
    when 'X' then @current_player = 'O'
    when 'O' then @current_player = 'X'
    end
  end

  def square_full?(square)
    @squares[square] != ' '
  end

  public

  def play_game
    loop do
      puts "The player is #{@current_player}"
      player_input(@current_player)
      if won?(@current_player)
        puts "#{@current_player} has won"
        break
      elsif board_full?
        puts 'Its a tie'
        break
      end
      switch_player(@current_player)
    end
  end
end


game = TicTacToe.new
game.play_game
