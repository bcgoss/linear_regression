require './test/test_helper'
require './lib/linear_regression'
class LinearRegressionTest < Minitest::Test
  def setup
    csv_path = './test/data/football_data.csv'
    @line_finder = LinearRegression.new(csv_path)
  end

  def test_it_reads_data
    assert_equal [[1, 0.75], [0.75, 0.75]], @line_finder.data[0..1]
  end

  def test_we_can_set_thetas
    @line_finder.set_thetas(1,2)

    assert_equal 1, @line_finder.theta0
    assert_equal 2, @line_finder.theta1
  end

  def test_it_finds_cost_when_thetas_match
    @line_finder.set_thetas(0.423,0.301)

    assert_equal 0.477, @line_finder.cost.round(3)
  end

  def test_it_finds_cost_when_thetas_dont_match
    @line_finder.set_thetas(1,2)

    assert_equal 61.965, @line_finder.cost.round(3)

    @line_finder.set_thetas(1,3)

    assert_equal 119.934, @line_finder.cost.round(3)
  end

  def test_learning_gradient_decnet
    @line_finder.set_thetas(1,1)

    @line_finder.learn

    assert_equal 0.788, @line_finder.theta0.round(3)
    assert_equal 0.883, @line_finder.theta1.round(3)

    @line_finder.learn
  end

  # def test_it_works_until_delta_is_small
  #   @line_finder.set_thetas(1,3)
  #   actual = @line_finder.learn_cycle
  #   assert_in_delta 0, actual.first, 0.3
  #   assert_in_delta 2, actual.last, 0.3
  # end
end
