require_relative 'player'
require_relative 'game_library'
require_relative 'questions'

  module MathGame

    class Game

      def initialize(num_players)
        @players = []
        num_players.times do |number|
          @players.push(Player.new(number))
        end
        @current_player = 0
      end

      def game_over?
        @players.any? { |player| player.lives <= 0}
      end

      def start
                
        loop do
          new_question = Questions.new
          puts "Player #{@current_player + 1}:"

          question = new_question.question_generator
          answer = gets.chomp

          puts "Answer was #{answer}"

          if (new_question.answer_checker?(answer.to_i))
            puts "Correct!"
          else
            puts "WRONG!!!"
            @players[@current_player].lose_life
          end

          puts "P1: #{@players[0].lives}/3 vs P2: #{@players[1].lives}/3"
          puts "----- NEW TURN -----"

          @current_player += 1

          if game_over?

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
