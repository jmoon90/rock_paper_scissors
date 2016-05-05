class RockPaperScissors
  class PlayerRecord
    def self.record
      @record ||= { win: 0, lose: 0, tie: 0 }
    end

    def self.hand_selection
      @hand_selection ||= { 'r' => 0, 'p' => 0, 's' => 0 }
    end

    def self.favorite_hand
      @favorite_hand ||= { hand: nil, count: 0 }
    end

    def self.last_move
      @last_move ||= { hand: nil }
    end
  end
end
