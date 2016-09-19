require './test/test_helper'
require './lib/linear_regression'
class LinearRegressionTest < Minitest::Test
  def setup
    csv_path = './test/data/data.csv'
    @line_finder = LinearRegression.new(csv_path)
  end

  def test_it_reads_data
    assert_equal [[1,2], [2,4]], @line_finder.data
  end

  def test_we_can_set_thetas
    @line_finder.set_thetas(1,2)

    assert_equal 1, @line_finder.theta0
    assert_equal 2, @line_finder.theta1
  end

  def test_it_finds_cost_when_thetas_match
    @line_finder.set_thetas(0,2)

    assert_equal 0, @line_finder.cost
  end

  def test_it_finds_cost_when_thetas_dont_match
    @line_finder.set_thetas(1,2)

    assert_equal 2, @line_finder.cost

    @line_finder.set_thetas(1,3)

    assert_equal 13, @line_finder.cost
  end

  def test_learning_gradient_decnet
    @line_finder.set_thetas(1,3)

    @line_finder.learn

    assert_equal 0.5, @line_finder.theta0
    assert_equal 2.35, @line_finder.theta1

    @line_finder.learn
  end

  def test_it_workes_until_delta_is_small
    @line_finder.set_thetas(1,3)

    assert_equal [0,2], @line_finder.learn_cycle
  end
end
