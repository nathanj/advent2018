require "../spec_helper"

describe "Day6" do
  points = "1, 1
1, 6
8, 3
3, 4
5, 5
8, 9".lines.map { |v| v.split(", ").map &.to_i }

  it "should compute areas" do
    compute_area(points).should eq 17
  end

  it "should compute areas for part 2" do
    compute_area_part2(points, 32).should eq 16
  end
end
