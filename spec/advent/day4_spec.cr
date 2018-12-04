require "../spec_helper"

describe "Day4" do
  it "parses log" do
    time, event = parse_guard_log("[1518-11-01 00:00] Guard #10 begins shift").not_nil!
    time.year.should eq 1518
    time.month.should eq 11
    time.day.should eq 1
    time.hour.should eq 0
    time.minute.should eq 0
    (event.as BeginShift).id.should eq 10
    time, event = parse_guard_log("[1518-09-16 00:24] falls asleep").not_nil!
    event.is_a?(FallsAsleep).should eq true
    time, event = parse_guard_log("[1518-04-06 00:56] wakes up").not_nil!
    event.is_a?(WakesUp).should eq true
  end

  it "calculates guards sleep minutes" do
    data = <<-EOF
[1518-11-01 00:00] Guard #10 begins shift
[1518-11-01 00:05] falls asleep
[1518-11-01 00:25] wakes up
[1518-11-01 00:30] falls asleep
[1518-11-01 00:55] wakes up
[1518-11-01 23:58] Guard #99 begins shift
[1518-11-02 00:40] falls asleep
[1518-11-02 00:50] wakes up
[1518-11-03 00:05] Guard #10 begins shift
[1518-11-03 00:24] falls asleep
[1518-11-03 00:29] wakes up
[1518-11-04 00:02] Guard #99 begins shift
[1518-11-04 00:36] falls asleep
[1518-11-04 00:46] wakes up
[1518-11-05 00:03] Guard #99 begins shift
[1518-11-05 00:45] falls asleep
[1518-11-05 00:55] wakes up
EOF
    events = data.lines.map { |v| parse_guard_log(v).not_nil! }
    find_guard_part1(process_guard_events(events)).should eq 240
    find_guard_part2(process_guard_events(events)).should eq 4455
  end
end
