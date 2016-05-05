class RockPaperScissors
  class Player
    def initialize(current_hand)
      @current_hand = current_hand
    end

    attr_reader :current_hand

    def favorite_hand
      RockPaperScissors::PlayerRecord.hand_selection.each do |hand,count|
        next if count.zero?

        if count > RockPaperScissors::PlayerRecord.favorite_hand[:count]
          RockPaperScissors::PlayerRecord.favorite_hand[:hand] = hand
          RockPaperScissors::PlayerRecord.favorite_hand[:count] = count
        end
      end
      PlayerRecord.favorite_hand
    end

    def last_move
      PlayerRecord.last_move
    end

    def update_player_last_move(hand)
      PlayerRecord.last_move[:hand] = hand
    end

    def update_player_hand_selection
      PlayerRecord.hand_selection[current_hand] += 1
    end
  end
end
