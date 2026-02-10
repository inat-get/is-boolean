# spec/is/boolean_spec.rb
# frozen_string_literal: true

require_relative "spec_helper"

RSpec.describe Boolean do
  describe "#to_i" do
    it "returns 1 for true" do
      expect(true.to_i).to eq(1)
    end

    it "returns 0 for false" do
      expect(false.to_i).to eq(0)
    end
  end

  describe "#<=>" do
    context "when comparing booleans" do
      it "returns 0 for equal values" do
        expect(true <=> true).to eq(0)
        expect(false <=> false).to eq(0)
      end

      it "returns -1 when false <=> true" do
        expect(false <=> true).to eq(-1)
      end

      it "returns 1 when true <=> false" do
        expect(true <=> false).to eq(1)
      end
    end

    context "when comparing with non-booleans" do
      it "returns nil for true <=> 1" do
        expect(true <=> 1).to be_nil
      end

      it "returns nil for false <=> 0" do
        expect(false <=> 0).to be_nil
      end

      it "returns nil for boolean <=> string" do
        expect(true <=> "true").to be_nil
        expect(false <=> "").to be_nil
      end

      it "returns nil for boolean <=> nil" do
        expect(true <=> nil).to be_nil
        expect(false <=> nil).to be_nil
      end

      it "returns nil for boolean <=> symbol" do
        expect(true <=> :true).to be_nil
        expect(false <=> :false).to be_nil
      end
    end
  end

  describe "Comparable methods" do
    describe "#<" do
      it "returns true for false < true" do
        expect(false < true).to be true
      end

      it "returns false for true < false" do
        expect(true < false).to be false
      end

      it "returns false for equal values" do
        expect(false < false).to be false
        expect(true < true).to be false
      end

      it "raises ArgumentError when comparing with non-boolean" do
        expect { false < 0 }.to raise_error(ArgumentError)
        expect { true < 1 }.to raise_error(ArgumentError)
      end
    end

    describe "#>" do
      it "returns true for true > false" do
        expect(true > false).to be true
      end

      it "returns false for false > true" do
        expect(false > true).to be false
      end

      it "raises ArgumentError when comparing with non-boolean" do
        expect { true > 0 }.to raise_error(ArgumentError)
      end
    end

    describe "#<=" do
      it "returns true for false <= true" do
        expect(false <= true).to be true
      end

      it "returns true for equal values" do
        expect(false <= false).to be true
        expect(true <= true).to be true
      end

      it "returns false for true <= false" do
        expect(true <= false).to be false
      end

      it "raises ArgumentError when comparing with non-boolean" do
        expect { false <= 0 }.to raise_error(ArgumentError)
      end
    end

    describe "#>=" do
      it "returns true for true >= false" do
        expect(true >= false).to be true
      end

      it "returns true for equal values" do
        expect(true >= true).to be true
        expect(false >= false).to be true
      end

      it "returns false for false >= true" do
        expect(false >= true).to be false
      end

      it "raises ArgumentError when comparing with non-boolean" do
        expect { true >= 1 }.to raise_error(ArgumentError)
      end
    end

    describe "#between?" do
      it "returns true for false.between?(false, true)" do
        expect(false.between?(false, true)).to be true
      end

      it "returns true for true.between?(false, true)" do
        expect(true.between?(false, true)).to be true
      end

      it "returns false for false.between?(true, true)" do
        expect(false.between?(true, true)).to be false
      end

      it "raises ArgumentError with non-boolean bounds" do
        expect { true.between?(0, 1) }.to raise_error(ArgumentError)
      end
    end
  end

  describe "module inclusion" do
    it "TrueClass includes Boolean" do
      expect(TrueClass.ancestors).to include(Boolean)
    end

    it "FalseClass includes Boolean" do
      expect(FalseClass.ancestors).to include(Boolean)
    end

    it "true responds to to_i" do
      expect(true).to respond_to(:to_i)
    end

    it "false responds to to_i" do
      expect(false).to respond_to(:to_i)
    end

    it "true responds to <=>" do
      expect(true).to respond_to(:<=>)
    end

    it "false responds to <=>" do
      expect(false).to respond_to(:<=>)
    end

    it "true/false is a Boolean" do
      expect(true.is_a?(Boolean)).to eq(true)
      expect(false.is_a?(Boolean)).to eq(true)
    end
  end

  describe "sorting" do
    it "sorts booleans correctly" do
      expect([true, false, true, false].sort).to eq([false, false, true, true])
    end

    it "raises error when sorting mixed array" do
      expect { [true, 1, false].sort }.to raise_error(ArgumentError)
    end
  end
end
