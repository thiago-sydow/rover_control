require 'spec_helper'

describe RoverControl do
  it 'has a version number' do
    expect(RoverControl::VERSION).not_to be nil
  end

  context 'with valid boundaries' do
    it 'receives and processes the commands' do
      str = "5 5\n1 2 N\nLMLMLMLMM\n3 3 E\nMMRMMRMRRM"
      expect(RoverControl.process_rovers_instructions(str)).to eq "1 3 N\n5 1 E"
    end
  end

  context 'with invalid boundaries' do
    it 'raises an error' do
      str = "5 \n1 2 N\nLMLMLMLMM\n3 3 E\nMMRMMRMRRM"
      expect { RoverControl.process_rovers_instructions(str) }.to raise_error(ArgumentError)
    end
  end

  context 'a lot of commands' do
    examples = [
      ["5 5\n1 2 N\nLMLMLMLMM\n3 3 E\nMMRMMRMRRM", "1 3 N\n5 1 E"],
      ["3 3\n1 2 S\nLMLMLMLMM\n3 3 E\nMMRMMRMRRM", "1 1 S\nerror"],
      ["3 4\n1 3 E\nLMLLLMLML\n3 2 S\nMLRMRRMLRM", "error\n3 2 N"],
      ["2 2\n2 2 W\nLMR", "2 1 W"],
      ["8 8\n5 6 W\nLMLRL\n2 4 E\nRMRML\n1 5 S\nRLMMRRRLRL\n0 0 N\nLRRMMRMMRR", "5 5 E\n1 3 S\n1 3 N\nerror"],
    ]
    examples.each do |input, output|
      it { expect(RoverControl.process_rovers_instructions(input)).to eq output }
    end
  end

end
