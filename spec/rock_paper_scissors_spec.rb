require 'spec_helper'

describe RockPaperScissors do

  describe '#start_game' do
    it 'updates record after game is played' do
      RockPaperScissors::PlayerRecord.record[:win] = 0
      RockPaperScissors::PlayerRecord.record[:tie] = 0
      RockPaperScissors::PlayerRecord.record[:lose] = 0
      allow(STDIN).to receive(:gets).and_return('s')
      allow(RockPaperScissors::PlayerRecord).to receive(:favorite_hand).and_return({ hand: 'r', count: 4 })

      start_game
      expect(RockPaperScissors::PlayerRecord.record).to eql({:win=>0, :lose=>1, :tie=>0})
    end

    it 'updates hand_selection after game is played' do
      RockPaperScissors::PlayerRecord.hand_selection['r'] = 0
      RockPaperScissors::PlayerRecord.hand_selection['s'] = 0
      RockPaperScissors::PlayerRecord.hand_selection['p'] = 0
      allow(STDIN).to receive(:gets).and_return('s')

      expect(RockPaperScissors::PlayerRecord.hand_selection).to eql({ 'r' => 0, 'p' => 0, 's' => 0 })
      start_game
      expect(RockPaperScissors::PlayerRecord.hand_selection).to eql({ 'r' => 0, 'p' => 0, 's' => 1 })
    end

    it 'expects set_user_hand' do
      allow(RockPaperScissors).to receive(:set_user_hand).once
    end

    it 'expects play_strategy' do
      allow(RockPaperScissors).to receive(:play_strategy).once
    end

    it 'expects update_player_info' do
      allow(RockPaperScissors).to receive(:update_player_info).once
    end

    describe 'play_strategy' do
      let(:player) { RockPaperScissors::Player.new 'r' }

      it 'plays RockPaperScissors::Strategies::Randomm if game_strategy is random' do
        rps = RockPaperScissors.new('last_move')
        expect(RockPaperScissors::Strategies::LastMove).to receive(:new).and_return(RockPaperScissors::Strategies::LastMove.new({player: player}))
        rps.send(:play_strategy)
      end

      it 'plays RockPaperScissors::Strategies.favorite if game_strategy is favorite' do
        rps = RockPaperScissors.new('favorite')
        expect(RockPaperScissors::Strategies::Favorite).to receive(:new).and_return(RockPaperScissors::Strategies::Favorite.new({player: player}))
        rps.send(:play_strategy)
      end
    end
  end

  private

  # don't want to output any messages for tests
  def start_game
    rps = RockPaperScissors.new 'favorite'
    rps.send(:set_user_hand)
    rps.send(:play_strategy)
    rps.send(:update_player_info)
  end
end
