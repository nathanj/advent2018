require "../spec_helper"

describe "Day7" do
  lines = "Step C must be finished before step A can begin.
Step C must be finished before step F can begin.
Step A must be finished before step B can begin.
Step A must be finished before step D can begin.
Step B must be finished before step E can begin.
Step D must be finished before step E can begin.
Step F must be finished before step E can begin.".lines

  it "should compute the graph" do
    compute_graph(lines).should eq "CABDFE"
  end

  it "should compute the graph part 2" do
    compute_graph_part2(lines, base_time: 0, num_elves: 2).should eq 15
  end
end
