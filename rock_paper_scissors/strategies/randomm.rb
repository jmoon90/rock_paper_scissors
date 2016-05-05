class RockPaperScissors
  class Strategies
    class Randomm
      def initialize(player:)
        @player = player
      end

      def play
        GameResult.check(player_hand: player.current_hand, computer_hand: computer_hand)
      end

      private

      attr_reader :player

      def computer_hand
        HANDS[RandomHand.number]
      end
    end
  end
end
