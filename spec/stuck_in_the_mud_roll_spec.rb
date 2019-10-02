require './stuck_in_the_mud_roll.rb'
require 'rspec'

RSpec.describe StuckInTheMudRoll do
  describe '#dice_available_next_roll' do
    context 'with 1,3,4,4,6' do
      subject { StuckInTheMudRoll.dice_available_next_roll(1, 3, 4, 4, 6) }

      it { is_expected.to eq 5 }
    end

    context 'with 1,2,3,4,5' do
      subject { StuckInTheMudRoll.dice_available_next_roll(1, 2, 3, 4, 5) }

      it { is_expected.to eq 3 }
    end

    context 'with 2,2,5,5,5' do
      subject { StuckInTheMudRoll.dice_available_next_roll(2, 2, 5, 5, 5) }

      it { is_expected.to eq 0 }
    end
  end

  describe '#score' do
    context 'with 1,1,1,1,1' do
      subject { StuckInTheMudRoll.new(1, 1, 1, 1, 1).score }

      it { is_expected.to eq 5 }
    end

    context 'with 1,1,1,2,5' do
      subject { StuckInTheMudRoll.new(1, 1, 1, 2, 5).score }

      it { is_expected.to eq 3 }
    end

    context 'with 2,2,2,5,5' do
      subject { StuckInTheMudRoll.new(2, 2, 2, 5, 5).score }

      it { is_expected.to eq 0 }
    end
  end

  describe '#end_of_turn' do
    context 'with 1,2,3,4,5' do
      subject { StuckInTheMudRoll.new(1, 2, 3, 4, 5).end_of_turn? }

      it { is_expected.to be false }
    end

    context 'with 2,2,5,5,5' do
      subject { StuckInTheMudRoll.new(2, 2, 5, 5, 5).end_of_turn? }

      it { is_expected.to be true }
    end
  end
end
