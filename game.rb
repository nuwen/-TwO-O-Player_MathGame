require_relative 'player'
require_relative 'game_library'
require_relative 'questions'
require_relative 'UI'

  module MathGame

    class Game

      def initialize(num_players)
        @players = []
        num_players.times do |number|
          @players.push(Player.new(number))
        end
        @current_player = 0
        @header = UI.new
      end

      def game_over?
        @players.any? { |player| player.lives <= 0}
      end

      def start

        loop do
          system "clear"
          @header.header(@players[0].lives, @players[1].lives)
          new_question = Questions.new
          puts "Player #{@current_player + 1}:"

          question = new_question.question_generator
          answer = gets.chomp

          puts "Answer was #{answer}"

          if (new_question.answer_checker?(answer.to_i))
            puts "Correct! Press Enter to continue.."
            gets
          else
            puts "WRONG!!! Press Enter to continue.."
            @players[@current_player].lose_life
            gets
          end

          @current_player += 1

          if game_over?
            system "clear"
            @header.header(@players[0].lives, @players[1].lives)
            @header.gameover
            puts "GAME OVER for PLAYER #{@current_player}"
            break
          end

          if @current_player == @players.length
              @current_player =0

          end
        end
      end
    end
  end


  if $0 == __FILE__
  MathGame::Game.new(2).start
  end
