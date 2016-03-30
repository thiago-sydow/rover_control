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

  describe '#turn' do
    let(:controller) { RoverControl::PositionController.new(%w(1 2 N), 5, 5) }

    context 'when turning left' do
      it 'updates to where rover is heading' do
        controller.turn 'L'
        expect(controller.to_s).to eq '1 2 W'
      end
    end

    context 'when turning right' do
      it 'updates to where rover is heading' do
        controller.turn 'R'
        expect(controller.to_s).to eq '1 2 E'
      end
    end
  end

  describe '#move' do
    context 'when heading North' do
      context 'and valid future position' do
        let(:controller) { RoverControl::PositionController.new(%w(1 2 N), 5, 5) }

        it 'updates y position' do
          controller.move
          expect(controller.to_s).to eq '1 3 N'
        end
      end

      context 'and with invalid future position' do
        let(:controller) { RoverControl::PositionController.new(%w(5 5 N), 5, 5) }

        it { expect { controller.move }.to raise_error(RoverControl::OutOfBoundariesError, "Can't go out of north boundaries") }
      end
    end

    context 'when heading West' do
      context 'and valid future position' do
        let(:controller) { RoverControl::PositionController.new(%w(1 2 W), 5, 5) }

        it 'updates x position' do
          controller.move
          expect(controller.to_s).to eq '0 2 W'
        end
      end

      context 'and with invalid future position' do
        let(:controller) { RoverControl::PositionController.new(%w(0 5 W), 5, 5) }

        it { expect { controller.move }.to raise_error(RoverControl::OutOfBoundariesError, "Can't go out of west boundaries") }
      end
    end

    context 'when heading South' do
      let(:controller) { RoverControl::PositionController.new(%w(1 2 S), 5, 5) }

      it 'updates y position' do
        controller.move
        expect(controller.to_s).to eq '1 1 S'
      end

      context 'invalid future position' do
        let(:controller) { RoverControl::PositionController.new(%w(1 0 S), 5, 5) }

        it { expect { controller.move }.to raise_error(RoverControl::OutOfBoundariesError, "Can't go out of south boundaries") }
      end
    end

    context 'when heading East' do
      let(:controller) { RoverControl::PositionController.new(%w(1 2 E), 5, 5) }

      it 'updates x position' do
        controller.move
        expect(controller.to_s).to eq '2 2 E'
      end

      context 'invalid future position' do
        let(:controller) { RoverControl::PositionController.new(%w(5 2 E), 5, 5) }

        it { expect { controller.move }.to raise_error(RoverControl::OutOfBoundariesError, "Can't go out of east boundaries") }
      end
    end
  end

  describe '#to_s' do
    let(:controller) { RoverControl::PositionController.new(%w(1 2 N), 5, 5) }

    it { expect(controller.to_s).to eq('1 2 N') }
  end

end
