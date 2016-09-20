require 'csv'
class DataFactory
  attr_reader :theta0, :theta1, :noise
  def initialize(path, params)
    @theta0 = params[:theta0] || 1
    @theta1 = params[:theta1] || 1
    @noise = params[:noise] || 4

    write_points(path, params[:limit])
  end

  def generate_point(x)
    (theta1 * x + theta0 + offset).to_i
  end

  def offset
    #random number from -noise/2 to +noise/2
    rand(noise) - (noise / 2)
  end

  def write_points(path, limit = 5)
    CSV.open(path, 'wb') do |csv|
      limit.times do |x|
        csv << [x, generate_point(x)]
      end
    end
  end
end
