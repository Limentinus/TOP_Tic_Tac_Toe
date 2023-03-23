require_relative '../tic_tac_toe'

describe TicTacToe do

  describe '#player_input' do
    subject(:input_game) { described_class.new }

    context "When the player inputs the square" do
      it 'updates the @squares array with the correct mark' do
        allow(input_game).to receive(:gets).and_return('5')
        input_game.player_input('O')
        squares = input_game.instance_variable_get(:@squares)
        expect(squares[4]).to eq('O')

      end
    end
  end

  describe '#won?' do
    context 'When three squares in a line are the same mark' do
      subject(:first_row_game) {described_class.new(['X', 'X', 'X', ' ', ' ', ' ', ' ', ' ', ' '])}
      
      it 'returns true for bottom row' do
        expect(first_row_game.won?('X')).to eq(true)
      end
    end

    context "When three squares in a different line are a different mark" do
      subject(:diagonal_game) { described_class.new(['O', ' ', ' ', ' ', 'O', ' ', ' ', ' ', 'O', ' ']) }

      it 'returns true for the diagonal line' do
        expect(diagonal_game.won?('O')).to eq(true)
      end
    end

    context "When none of the lines are full" do
      subject(:random_game) { described_class.new(['O', 'X', 'O', ' ', ' ', ' ', ' ', ' ', 'X'])}

      it 'returns false' do
        expect(random_game.won?('X')).to eq(false)
      end
    end
  end

  describe '#board_full?' do
    context 'When the board is full' do
      subject(:full_board) { described_class.new(Array.new(9, 'X'))}
      it 'returns true' do
        expect(full_board.board_full?).to eq(true)
      end
    end
  end
end