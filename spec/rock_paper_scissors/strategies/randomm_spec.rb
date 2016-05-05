require 'spec_helper'

describe 'Randomm' do
  let(:player) { RockPaperScissors::Player.new 'r' }

  it "computer plays random hand" do
    player.favorite_hand[:hand] = nil
    expect(Random).to receive(:rand).once.with(3).and_return(1)
    RockPaperScissors::Strategies::Favorite.new(player).play
  end
end
