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

    def move
      case @heading
      when 'N'
        raise OutOfBoundariesError.new "Can't go out of north boundaries" if @y >= @y_limit
        @y += 1
      when 'S'
        raise OutOfBoundariesError.new "Can't go out of south boundaries" if @y <= 0
        @y -= 1
      when 'E'
        raise OutOfBoundariesError.new "Can't go out of east boundaries" if @x >= @x_limit
        @x += 1
      when 'W'
        raise OutOfBoundariesError.new "Can't go out of west boundaries" if @x <= 0
        @x -= 1
      end
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
