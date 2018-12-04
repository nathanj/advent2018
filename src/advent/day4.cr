abstract struct GuardEvent; end

record BeginShift < GuardEvent,
  id : Int32
record FallsAsleep < GuardEvent
record WakesUp < GuardEvent

def parse_guard_log(str)
  if /\[(.*)\] (.*)/ =~ str
    time = Time.parse_local($1, "%F %R")
    log = $2
    if /Guard #(\d+) begins shift/ =~ log
      return {time, BeginShift.new($1.to_i)}
    elsif /falls asleep/ =~ log
      return {time, FallsAsleep.new}
    elsif /wakes up/ =~ log
      return {time, WakesUp.new}
    end
  end
  return nil
end

def process_guard_events(events)
  current_guard = 0
  sleep_start = 0
  # hash of guard to array of each minute he is asleep
  guard_asleep_minute = {} of Int32 => Array(Int32)
  events.each do |(time, event)|
    case event
    when BeginShift
      current_guard = event.id
    when FallsAsleep
      sleep_start = time.minute
    when WakesUp
      sleep_end = time.minute
      a = guard_asleep_minute.fetch(current_guard, [] of Int32)
      (sleep_start...sleep_end).each do |v|
        a << v
      end
      guard_asleep_minute[current_guard] = a
    end
  end
  return guard_asleep_minute
end

def find_guard(guard_asleep_minute, &max_guard : Array(Int32) -> Int32)
  target = guard_asleep_minute.max_by { |k, v| max_guard.call(v) }
  target_id = target[0]
  occurrences = Hash(Int32, Int32).new() { 0 }
  target[1].each { |v| occurrences[v] += 1 }
  target_minute = occurrences.max_by { |k, v| v }[0]
  return target_id * target_minute
end

# Finds guard with most minutes
def find_guard_part1(guard_asleep_minute)
  find_guard(guard_asleep_minute) do |v|
    v.size
  end
end

# Finds guard with most occurrences of a particular minute
def find_guard_part2(guard_asleep_minute)
  find_guard(guard_asleep_minute) do |v|
    occurrences = Hash(Int32, Int32).new() { 0 }
    v.each { |v| occurrences[v] += 1 }
    occurrences.max_by { |k, v| v }[1]
  end
end
