require 'spec_helper'

describe 'GameResult' do
  describe "result when user plays 'r'" do
    let(:player_hand) { 'r' }

    it "when compuer plays 'r'" do
      RockPaperScissors::GameResult.check(player_hand: player_hand, computer_hand: 'r')
      expect(RockPaperScissors::GameResult.result).to eql({:outcome=>:tie, :message=>"Computer chose 'r'. It's a tie!"})
    end

    it "when compuer plays 'p'" do
      RockPaperScissors::GameResult.check(player_hand: player_hand, computer_hand: 'p')
      expect(RockPaperScissors::GameResult.result).to eql({:outcome=>:lose, :message=>"Computer chose 'p'. You lose"})
    end

    it "when compuer plays 's'" do
      RockPaperScissors::GameResult.check(player_hand: player_hand, computer_hand: 's')
      expect(RockPaperScissors::GameResult.result).to eql({:outcome=>:win, :message=>"Computer chose 's'. You win!"})
    end
  end
end
