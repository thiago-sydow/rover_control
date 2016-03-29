require 'spec_helper'

describe RoverControl::Rover do
  let(:rover) { RoverControl::Rover.new('1 2 N', 5, 5) }

  describe '#initialize' do
    context 'with invalid rover position' do
      it 'pass parameters to PositionController' do
        expect(RoverControl::PositionController).to receive(:new).with(%w(1 2 N), 5, 5)
        RoverControl::Rover.new('1 2 N', 5, 5)
      end
    end

    context 'with position outside boundaries' do
      it { expect { RoverControl::Rover.new('1 6 N', 5, 5) }.to raise_error(ArgumentError, /Position outside Boundaries/) }
    end

    context 'with valid position' do
      it { expect(RoverControl::Rover.new('1 2 N', 5, 5)).not_to be_nil }
    end
  end

end
