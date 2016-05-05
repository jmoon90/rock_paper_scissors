require 'spec_helper'

describe 'PlayerRecord' do
  describe 'hand_selection' do
    it 'returns players hand_selection' do
      expect(RockPaperScissors::PlayerRecord.hand_selection).to eql({ 'r' => 0, 'p' => 0, 's' => 0 })
    end
  end

  describe 'favorite_hand' do
    it 'returns players favorite_hand' do
      expect(RockPaperScissors::PlayerRecord.favorite_hand).to eql({ hand: nil, count: 0 })
    end
  end

  describe 'last_move' do
    it 'returns players last_move' do
      expect(RockPaperScissors::PlayerRecord.last_move).to eql({ hand: nil })
    end
  end
end
