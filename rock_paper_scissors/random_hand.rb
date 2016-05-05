class RockPaperScissors
  module RandomHand
    def self.number(numbers = 3)
      Random.rand(numbers)
    end
  end
end
