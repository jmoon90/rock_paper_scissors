class RockPaperScissors
  class StrategiesLists
    def self.list
      { 'favorite' => RockPaperScissors::Strategies::Favorite,
        'last_move' => RockPaperScissors::Strategies::LastMove,
        'randomm' => RockPaperScissors::Strategies::Randomm }
    end
  end
end
