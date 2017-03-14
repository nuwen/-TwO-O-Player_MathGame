require_relative 'player'

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
        puts 'Game Started'
        loop do

          puts "Player #{@current_player + 1}: What does 5 plus 3 equal?"

          answer = gets.chomp

          puts "Answer was #{answer}"

          if answer.to_i == 8
            puts "Correct!"
          else
            "WRONG!!!"
            @players[@current_player].lose_life
          end

          puts "P1: #{@players[0].lives}/3 vs P2: #{@players[1].lives}/3"
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
