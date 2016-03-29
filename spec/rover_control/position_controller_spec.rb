require 'spec_helper'

describe RoverControl::PositionController do

  describe '#initialize' do
    context 'with invalid rover position' do
      it  { expect { RoverControl::PositionController.new(%w(1 2), 5, 5) }.to raise_error(ArgumentError, /Rover Position is missing parameters/) }
    end

    context 'with position outside boundaries' do
      it { expect { RoverControl::PositionController.new(%w(1 6 N), 5, 5) }.to raise_error(ArgumentError, /Position outside Boundaries/) }
    end

    context 'with valid position' do
      it { expect(RoverControl::PositionController.new(%w(1 2 N), 5, 5)).not_to be_nil }
    end
  end

end
