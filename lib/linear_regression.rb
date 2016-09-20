require 'csv'
class LinearRegression
  attr_reader :data, :theta0, :theta1

  def initialize(data_path)
    @data = []
    CSV.foreach(data_path) do |row|
      @data << row.map { |element| element.to_i }
    end
    @learning_rate = 0.01
    @threshold = 0.0001
  end

  def set_thetas(theta0, theta1)
    @theta0 = theta0
    @theta1 = theta1
  end

  def hypothesis_function(input)
    theta0 + theta1 * input
  end

  def cost
    @data.reduce(0) do |result, (input, expected)|
      result += (hypothesis_function(input) - expected)**2
    end
  end

  def learn
    # require 'pry';binding.pry
    old_theta0 = @theta0
    old_theta1 = @theta1
    update_theta0
    update_theta1
    Math.sqrt((old_theta0 - @theta0)**2 + (old_theta1 - @theta1)**2)
  end

  def update_theta0
    @theta0 -= @learning_rate * @data.reduce(0) do |result, (input, expected)|
      result += hypothesis_function(input) - expected
    end
  end

  def update_theta1
    @theta1 -= @learning_rate * @data.reduce(0) do |result, (input, expected)|
      result += (hypothesis_function(input) - expected) * input
    end
  end

  def learn_cycle
    delta = learn
    while delta > @threshold
      delta = learn
      p [@theta0, @theta1]
    end
    [@theta0,@theta1]
  end
end
