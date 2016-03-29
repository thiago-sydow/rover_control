require "rover_control/version"

module RoverControl
  module_function

  def process_rovers_instructions(instructions)
    instruction_lines = instructions.split("\n")
    boundaries = instruction_lines.shift.split(' ')

    raise ArgumentError.new('Invalid Boundaries') if boundaries.size != 2

    x_limit, y_limit = boundaries
    response = []

    instruction_lines.each_slice(2) do |rover_instructions|

    end

    response.join("\n")
  end

end
