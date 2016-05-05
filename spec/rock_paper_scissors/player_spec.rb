require 'spec_helper'

describe 'Player' do
  let(:player) { RockPaperScissors::Player.new 'r' }

  describe 'favorite_hand' do
    it 'returns favorite_hand' do
      RockPaperScissors::PlayerRecord.favorite_hand[:hand] = 'p'
      RockPaperScissors::PlayerRecord.favorite_hand[:count] = 2
      expect(player.favorite_hand).to eql({hand: 'p', count: 2})
    end
  end

  describe 'last_move' do
    before do
      RockPaperScissors::PlayerRecord.last_move[:hand] = 'p'
    end
    it 'returns last_move' do
      expect(player.last_move).to eql({hand: 'p'})
    end
    it 'updates last move' do
      expect(player.last_move).to eql({hand: 'p'})

      player.update_player_last_move('r')
      expect(player.last_move).to eql({hand: 'r'})
    end
  end

  describe 'favorite_hand' do
    before do
      RockPaperScissors::PlayerRecord.favorite_hand[:hand] = 'p'
      RockPaperScissors::PlayerRecord.favorite_hand[:count] = 1
    end

    it 'returns favorite_hand' do
      expect(player.favorite_hand).to eql({hand: 'p', count: 1})
    end

    it 'updates favorite_hand' do
      expect(player.favorite_hand).to eql({hand: 'p', count: 1})
      allow(RockPaperScissors::PlayerRecord).to receive(:hand_selection).and_return({"r"=>2, "p"=>1, "s"=>0})

      expect(player.favorite_hand).to eql({hand: 'r', count: 2})
    end
  end

  describe 'update_player_hand_selection' do
    it 'returns updated hand_selection' do
      RockPaperScissors::PlayerRecord.hand_selection['r'] = 1
      expect(RockPaperScissors::PlayerRecord.hand_selection).to eql({"r"=>1, "p"=>0, "s"=>0})

      player.update_player_hand_selection
      expect(RockPaperScissors::PlayerRecord.hand_selection).to eql({"r"=>2, "p"=>0, "s"=>0})
    end
  end

  describe 'current_hand' do
    it 'returns current hand' do
      expect(player.current_hand).to eql('r')
    end
  end
end
