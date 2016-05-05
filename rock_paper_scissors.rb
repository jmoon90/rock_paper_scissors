require 'byebug'

require_relative 'rock_paper_scissors/strategies/favorite.rb'
require_relative 'rock_paper_scissors/strategies/last_move.rb'
require_relative 'rock_paper_scissors/game_result.rb'
require_relative 'rock_paper_scissors/player.rb'
require_relative 'rock_paper_scissors/player_record.rb'
require_relative 'rock_paper_scissors/strategies.rb'
require_relative 'rock_paper_scissors/random_hand.rb'

class RockPaperScissors
  class RockPaperScissorsStrategyArgumentError < StandardError; end
  HANDS = ['r', 'p', 's']
  def initialize(strategy)
    fail RockPaperScissorsStrategyArgumentError unless ['last_move', 'favorite'].include?(strategy)
    @strategy = strategy
  end

  def start_game
    display_beginning_message
    set_user_hand

    play_startegy

    display_game_results
    display_game_summary

    update_player_info

    self.start_game
  end

  private

  def display_game_results
    puts GameResult.result[:message]
  end

  def display_game_summary
    PlayerRecord.record[GameResult.result[:outcome]] += 1
    puts "you won #{PlayerRecord.record[:win]} times. \nyou lost #{PlayerRecord.record[:lose]} times. \nwe tied #{PlayerRecord.record[:tie]} times."
  end

  def display_beginning_message
    puts "You are playing against strategy '#{@strategy}'."
    print "Type 'r', 'p' or 's'. \n>"
  end

  def update_player_info
    player.update_player_last_move(@hand)
    player.update_player_hand_selection
    player.favorite_hand
  end

  def play_startegy
    Strategies.list[@strategy].new(player: player).play
  end

  def set_user_hand
    @hand = STDIN.gets.chomp
    if !HANDS.include?(@hand)
      display_beginning_message
      self.send(:set_user_hand)
    end
  end

  def player
    @player = Player.new(@hand)
  end
end

RockPaperScissors.new(ARGV[0]).start_game if ARGV[0].respond_to?(:match) && !ARGV[0].match(/spec/)
