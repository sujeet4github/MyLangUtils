require "spec_helper"

describe "A test with multiple expectations" do
  let(:some_json_structure) {
    {
      "location" => {
        "latitude" => 54.5,
        "longitude" => 1,
      },
      "name" => "Single page web apps don't work"
    }
  }

	# Anti-Pattern, multiple expectation in the same test
	it "passes" do
    expect(some_json_structure.fetch("location").fetch("latitude")).to be_an_instance_of(Float)
    expect(some_json_structure.fetch("location").fetch("longitude")).to be_an_instance_of(Fixnum)
    expect(some_json_structure.fetch("name")).to eq("Single page web apps don't work")
	end
	
	# separate expectations - simple way
	context "all tests for some_json_structure" do
		it "latitude check" do
			expect(some_json_structure.fetch("location").fetch("latitude")).to be_an_instance_of(Float)
		end
		it "longitude check" do
			expect(some_json_structure.fetch("location").fetch("longitude")).to be_an_instance_of(Fixnum)
		end
		it "name check" do
			expect(some_json_structure.fetch("name")).to eq("Single page web apps don't work")
		end
	end

	# Using composed expectations, more efficient way of doing separate expectation per test
  context "composed expectation" do
    it "matches" do
      expect(some_json_structure).to match(
        "location" => {
          "latitude" => 54.5,
          "longitude" => be_an_instance_of(Fixnum)
        },
        "name" => /.*/
      )
    end
  end

end
