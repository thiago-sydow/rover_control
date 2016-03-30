require "rover_control/version"
require "rover_control/rover"
require "rover_control/position_controller"
require "rover_control/invalid_command_error"
require "rover_control/out_of_boundaries_error"

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
      response << send_to_rover(rover, commands)
    end

    response.join("\n")
  end

  private

  def self.send_to_rover(rover, commands)
    rover.process_commands(commands)
  rescue
    'error'
  end

end
