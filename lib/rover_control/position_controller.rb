module RoverControl
  class PositionController

    CARDINAL_DIRECTIONS = %w(N E S W)

    def initialize(rover_position, x_limit, y_limit)
      raise ArgumentError.new("Rover Position is missing parameters") if rover_position.size != 3

      x, y, @heading = rover_position

      @x = x.to_i
      @y = y.to_i
      @x_limit = x_limit
      @y_limit = y_limit

      raise ArgumentError.new("Position outside Boundaries") unless inside_boundaries?
    end

    def to_s
      "#{@x} #{@y} #{@heading}"
    end

    private

    def inside_boundaries?
      @x.between?(0, @x_limit) && @y.between?(0, @y_limit) && CARDINAL_DIRECTIONS.include?(@heading)
    end

  end
end
