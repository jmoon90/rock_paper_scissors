class RockPaperScissors
  class Strategies
    class Favorite
      def initialize(player)
        @player = player
      end

      def play
        GameResult.check(player.current_hand, computer_hand)
      end

      private

      attr_reader :player

      def computer_hand
        player.favorite_hand[:hand] || HANDS[RandomHand.number]
      end
    end
  end
end
