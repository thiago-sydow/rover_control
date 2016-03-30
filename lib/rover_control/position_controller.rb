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

    def turn(side)
      rotation_factor = side == 'L' ? -1 : 1
      pos = CARDINAL_DIRECTIONS.index(@heading) + rotation_factor
      @heading = CARDINAL_DIRECTIONS[pos % CARDINAL_DIRECTIONS.size]
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
