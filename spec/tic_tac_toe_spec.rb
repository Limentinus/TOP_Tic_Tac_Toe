require_relative '../tic_tac_toe'

describe TicTacToe do
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
end