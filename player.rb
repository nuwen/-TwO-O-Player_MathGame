module MathGame

  class Player

    attr_reader :score
    attr_reader :lives

    def initialize(number)
      @number = number
      @score = 0
      @lives = 3
    end

    def lose_life
      @lives += -1
    end

  end

end
