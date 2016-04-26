class RockPaperScissors
  module GameResult
    def self.check(player_hand:, computer_hand:)
      if player_hand == computer_hand
        result[:outcome] = :tie
        result[:message] = "Computer chose '#{computer_hand}'. It's a tie!"
      elsif computer_hand == WINNING_HAND[player_hand].winning_hand
        result[:outcome] = :win
        result[:message] = "Computer chose '#{computer_hand}'. You win!"
      else
        result[:outcome] = :lose
        result[:message] = "Computer chose '#{computer_hand}'. You lose"
      end
    end

    def self.result
      @result ||= { outcome: nil, message: nil }
    end

    private

    State = Struct.new(:player_hand, :winning_hand) do
      def to_s
        name
      end
    end

    WINNING_HAND = {
      'r' => State.new('rock', 's'),
      'p' => State.new('paper', 'r'),
      's' => State.new('scissors', 'p'),
    }
  end
end
