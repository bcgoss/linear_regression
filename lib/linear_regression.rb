require 'csv'
class LinearRegression
  attr_reader :data, :theta0, :theta1

  def initialize(data_path)
    @data = []
    CSV.foreach(data_path) do |row|
      @data << row.map { |element| element.to_i }
    end
    @learning_rate = 0.1
    @threshold = 0.0001
  end

  def set_thetas(theta0, theta1)
    @theta0 = theta0
    @theta1 = theta1
  end

  def f_of_x(input)
    theta0 + theta1 * input
  end

  def cost
    @data.reduce(0) do |result, (input, expected)|
      # require 'pry';binding.pry
      result += (f_of_x(input) - expected)**2
    end
  end

  def learn
    old_theta0 = @theta0
    old_theta1 = @theta1
    update_theta0
    update_theta1
    delta = Math.sqrt((old_theta0 - @theta0)**2 + (old_theta1 - @theta1)**2)
  end

  def update_theta0
    @theta0 -= @learning_rate * @data.reduce(0) do |result, (input, expected)|
      result += f_of_x(input) - expected
    end
  end

  def update_theta1
    @theta1 -= @learning_rate * @data.reduce(0) do |result, (input, expected)|
      result += (f_of_x(input) - expected) * input
    end
  end

  def learn_cycle
    while learn > @threshold
    end
    [@theta0,@theta1]
  end
end
