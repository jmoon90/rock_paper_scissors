require 'spec_helper'

describe 'GameResult' do
  describe "result when user plays 'r'" do
    let(:player_hand) { 'r' }

    it "when compuer plays 'r'" do
      RockPaperScissors::GameResult.check(player_hand: player_hand, computer_hand: 'r')
      expect(RockPaperScissors::GameResult.message).to eql("Computer chose 'r'. It's a tie!")
    end

    it "when compuer plays 'p'" do
      RockPaperScissors::GameResult.check(player_hand: player_hand, computer_hand: 'p')
      expect(RockPaperScissors::GameResult.message).to eql("Computer chose 'p'. You lose")
    end

    it "when compuer plays 's'" do
      RockPaperScissors::GameResult.check(player_hand: player_hand, computer_hand: 's')
      expect(RockPaperScissors::GameResult.message).to eql("Computer chose 's'. You win!")
    end
  end
end
