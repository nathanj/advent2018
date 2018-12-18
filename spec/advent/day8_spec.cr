require "../spec_helper"

describe "Day8" do
  str = "2 3 0 3 10 11 12 1 1 0 1 99 2 1 1 2"
  tree = parse_tree_str(str)

  it "should sum the metadata" do
    sum_metadata(tree).should eq 138
  end

  it "should sum the metadata part 2 " do
    sum_metadata_part2(tree).should eq 66
  end
end
