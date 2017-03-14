require_relative 'game'


class GameLibrary

  def start_math_game
    MathGame::Game.new(2).start
  end

end
