require 'spec_helper'

describe RockPaperScissors do

  describe '#start_game' do
    describe 'play_strategy' do
      let(:player) { RockPaperScissors::Player.new 'r' }

      it 'plays RockPaperScissors::Strategies::Randomm if game_strategy is random' do
        rps = RockPaperScissors.new('last_move')
        expect(RockPaperScissors::Strategies::LastMove).to receive(:new).and_return(RockPaperScissors::Strategies::LastMove.new({player: player}))
        rps.send(:play_startegy)
      end

      it 'plays RockPaperScissors::Strategies.favorite if game_strategy is favorite' do
        rps = RockPaperScissors.new('favorite')
        expect(RockPaperScissors::Strategies::Favorite).to receive(:new).and_return(RockPaperScissors::Strategies::Favorite.new({player: player}))
        rps.send(:play_startegy)
      end
    end

    # it 'call on set_user_hand' do
    #   rps = RockPaperScissors.new('last_move')
    #   rps.send(:set_user_hand) = double()
    #
    #   rps.start_game
    # end

  end
end
