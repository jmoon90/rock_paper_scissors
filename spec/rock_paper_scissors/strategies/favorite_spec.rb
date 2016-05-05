require 'spec_helper'

describe 'Favorite' do
  let(:player) { RockPaperScissors::Player.new 'r' }

  it "computer plays random hand if player has 0 moves" do
    player.favorite_hand[:hand] = nil
    expect(Random).to receive(:rand).once.with(3).and_return(1)
    RockPaperScissors::Strategies::Favorite.new(player: player).play
  end

  it "plays players most played move 's'" do
    player.favorite_hand[:hand] = 's'
    result = RockPaperScissors::Strategies::Favorite.new(player: player).play

    expect(result).to eq("Computer chose 's'. You win!")
  end

  it "plays players most played move 'p'" do
    player.favorite_hand[:hand] = 'p'
    result = RockPaperScissors::Strategies::Favorite.new(player: player).play
    expect(result).to eq("Computer chose 'p'. You lose")
  end

  it "plays players most played move 'r'" do
    player.favorite_hand[:hand] = 'r'
    result = RockPaperScissors::Strategies::Favorite.new(player: player).play
    expect(result).to eq("Computer chose 'r'. It's a tie!")
  end
end
