require "spec_helper"

class Collaborator
  def complex_method
    @state ||= []
    @state << rand
    @state[@state.count/2]
  end
end


class Tested
  attr_reader :collaborator

  def initialize
    @collaborator = Collaborator.new
  end

  def foo
    if @collaborator.complex_method > 0.5
      "high"
    else
      "low"
    end
  end
end

RSpec.describe Tested do
  subject(:tested) { Tested.new }

  describe "#foo" do
    context "When the random value is high" do

    	# creating a stub - stubbing the complex_method method
      before do
        allow(tested.collaborator).to receive(:complex_method).and_return(1)
      end

		# If the collaborator API changes, and it is a 3rd party API,
		# we may be missing condition and may be limited testing

      it "returns high" do
        expect(tested.foo).to eq("high")
      end
    end
  end
end