require "./spec_helper"

describe "Day1" do
  it "finds repeated frequencies" do
    find_repeated_frequency([+1, -1]).should eq 0
    find_repeated_frequency([+3, +3, +4, -2, -4]).should eq 10
    find_repeated_frequency([-6, +3, +8, +5, -6]).should eq 5
    find_repeated_frequency([+7, +7, -2, -7, -4]).should eq 14
  end
end
