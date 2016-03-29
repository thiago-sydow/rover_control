module RoverControl
  class Rover

    def initialize(rover_position, x_limit, y_limit)
      @position = PositionController.new(rover_position.split(' '), x_limit, y_limit)
    end

  end

end
