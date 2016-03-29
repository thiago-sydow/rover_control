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
    it 'receives and processes the commands' do
      str = "5 \n1 2 N\nLMLMLMLMM\n3 3 E\nMMRMMRMRRM"
      expect { RoverControl.process_rovers_instructions(str) }.to raise_error(ArgumentError)
    end
  end

end
