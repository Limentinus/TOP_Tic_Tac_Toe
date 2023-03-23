require_relative '../tic_tac_toe'

describe TicTacToe do
  describe '#won?' do
    subject(:test_game) {TicTacToe.new(['X', 'X', 'X', ' ', ' ', ' ', ' ', ' ', ' '])}

    context 'When three squares in a line are the same mark' do
      it 'returns true for top row' do
        expect(test_game.won?('X')).to eq(true)
      end
    end
  end
end