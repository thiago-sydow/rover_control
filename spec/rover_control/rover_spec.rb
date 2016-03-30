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

  describe '#process_commands' do
    context 'when command is to move' do
      it 'calls Position#move method' do
        expect_any_instance_of(RoverControl::PositionController).to receive(:move)
        rover.process_commands('M')
      end
    end

    context 'when command is to turn' do
      context 'to the right' do
        it 'calls Position#turn method with R' do
          expect_any_instance_of(RoverControl::PositionController).to receive(:turn).with('R')
          rover.process_commands('R')
        end
      end

      context 'to the left' do
        it 'calls Position#turn method with L' do
          expect_any_instance_of(RoverControl::PositionController).to receive(:turn).with('L')
          rover.process_commands('L')
        end

      end
    end

    context 'when command is invalid' do
      it { expect { rover.process_commands('X') }.to raise_error(RoverControl::InvalidCommandError) }
    end
  end

  describe '#current_position' do
    context 'when initialized position is 1 2 N' do
      it { expect(rover.current_position).to eq('1 2 N') }
    end
  end

end
