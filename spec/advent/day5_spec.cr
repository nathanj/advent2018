require "../spec_helper"

describe "Day5" do
  it "should react polymer" do
    react_polymer("dabAcCaCBAcCcaDA").should eq "dabCBAcaDA"
  end

  it "should find the improved polymer" do
    react_polymer_improved("dabAcCaCBAcCcaDA").should eq "daDA"
  end
end
