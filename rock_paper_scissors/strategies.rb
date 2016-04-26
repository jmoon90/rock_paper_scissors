class RockPaperScissors
  class Strategies
    def self.list
      { 'favorite' => RockPaperScissors::Strategies::Favorite,
        'last_move' => RockPaperScissors::Strategies::LastMove }
    end
  end
end
