require 'spec_helper'

describe 'last_move' do
  let(:player) { RockPaperScissors::Player.new 'r' }

  it 'computer plays last player_hand (s). player wins' do
    player.update_player_last_move('s')
    result = RockPaperScissors::Strategies::LastMove.new(player).play
    expect(result).to eq("Computer chose 's'. You win!")
  end

  it 'computer plays random hand if this is the first game' do
    player.update_player_last_move(nil)
    result = RockPaperScissors::Strategies::LastMove.new(player).play

    expect(Random).to receive(:rand).once.with(3).and_return(1)
    RockPaperScissors::Strategies::LastMove.new(player).play
  end
end
