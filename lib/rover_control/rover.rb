module RoverControl
  class Rover

    def initialize(rover_position, x_limit, y_limit)
      @position = PositionController.new(rover_position.split(' '), x_limit, y_limit)
    end

    def process_commands(commands)
      commands.chars.each do |command|
        if command == 'M'
          @position.move
        elsif %w(R L).include?(command)
          @position.turn(command)
        else
          raise InvalidCommandError
        end
      end

      current_position
    end

    def current_position
      @position.to_s
    end

  end
end
