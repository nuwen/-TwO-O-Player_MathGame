class Questions

  def initialize()
    @value_one = rand(1..20)
    @value_two = rand(1..20)
    @answer = @value_one + @value_two
  end

  def question_generator
    puts "What is #{@value_one} plus #{@value_two} ?"
  end

  def answer_checker?(input)
    input == @answer
  end
end
