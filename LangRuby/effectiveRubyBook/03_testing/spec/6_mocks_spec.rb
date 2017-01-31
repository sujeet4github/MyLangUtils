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
      it "calls the complex method on the collaborator" do

      	# Using a mock
        expect(tested.collaborator).to receive(:complex_method).and_return(1)

			# The above would be a good API contract test

        tested.foo

      end
    end
  end
end