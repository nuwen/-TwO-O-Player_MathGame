class Questions

  def initialize()
    @value_one = rand(1..20)
    @value_two = rand(1..20)

    @operand = rand(1..4)
    case @operand
      when 1
        @answer = @value_one + @value_two
      when 2
        @answer = @value_one - @value_two
      when 3
        @answer = @value_one * @value_two
      when 4
        @answer = @value_one / @value_two
      end
  end

  def question_generator
    case @operand
    when 1
      puts "What is #{@value_one} plus #{@value_two} ?"
    when 2
      puts "What is #{@value_one} minus #{@value_two} ?"
    when 3
      puts "What is #{@value_one} times #{@value_two} ?"
    when 4
      puts "What is #{@value_one} divided #{@value_two} to the nearest one?"
    end
  end


  def answer_checker?(input)
    input == @answer
  end
end
