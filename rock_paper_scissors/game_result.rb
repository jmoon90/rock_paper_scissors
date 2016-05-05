class RockPaperScissors
  module GameResult
    def self.check(player_hand:, computer_hand:)
      if player_hand == computer_hand
        PlayerRecord.record[:tie] += 1
        @message = "Computer chose '#{computer_hand}'. It's a tie!"
      elsif computer_hand == WINNING_HAND[player_hand].winning_hand
        PlayerRecord.record[:win] += 1
        @message = "Computer chose '#{computer_hand}'. You win!"
      else
        PlayerRecord.record[:lose] += 1
        @message = "Computer chose '#{computer_hand}'. You lose"
      end
    end

    def self.message
      @message
    end

    private

    State = Struct.new(:winning_hand) do
      def to_s
        name
      end
    end

    WINNING_HAND = {
      'r' => State.new('s'),
      'p' => State.new('r'),
      's' => State.new('p'),
    }
  end
end
