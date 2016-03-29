require "rover_control/version"
require "rover_control/rover"
require "rover_control/position_controller"

module RoverControl
  module_function

  def process_rovers_instructions(instructions)
    instruction_lines = instructions.split("\n")
    boundaries = instruction_lines.shift.split(' ')

    raise ArgumentError.new('Invalid Boundaries') if boundaries.size != 2

    x_limit, y_limit = boundaries
    response = []

    instruction_lines.each_slice(2) do |rover_instructions|
      rover_position, commands = rover_instructions
      rover = Rover.new(rover_position, x_limit.to_i, y_limit.to_i)
      response << rover.process_commands(commands)
    end

    response.join("\n")
  end

end
