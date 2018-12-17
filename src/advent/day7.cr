def parse_dag(lines)
  dag = {} of Char => Set(Char)
  lines.each do |line|
    if line =~ /Step ([A-Z]) must be finished before step ([A-Z]) can begin./
      node = $2[0]
      dep = $1[0]
      deps = dag.fetch(node) { Set(Char).new }
      deps << dep
      dag[node] = deps

      depnode = dag.fetch(dep) { Set(Char).new }
      dag[dep] = depnode
    end
  end
  dag
end

def compute_graph(lines)
  dag = parse_dag(lines)
  String.build do |str|
    while dag.size > 0
      val = dag.select { |k, v| v.size == 0 }
        .keys
        .sort
        .first
      str << val

      dag.delete(val)
      dag.each { |k, v| v.delete(val) }
    end
  end
end

class ElfWorker
  property work : Char | Nil = nil
  property time_left : Int32 = 0
end

def compute_graph_part2(lines, base_time = 60, num_elves = 5)
  dag = parse_dag(lines)
  elves = Array.new(num_elves) { ElfWorker.new }
  ticks = -1
  while dag.size > 0 || !elves.find { |e| !e.work.nil? }.nil?
    ticks += 1
    elves.each do |e|
      if !e.work.nil?
        e.time_left -= 1
        if e.time_left == 0
          dag.each do |k, v|
            v.delete(e.work)
          end
          e.work = nil
        end
      end
    end
    vals = dag.select { |k, v| v.size == 0 }
      .keys
      .sort
      .each do |v|
        elves.find { |e| e.work.nil? }.try do |elf|
          elf.work = v
          elf.time_left = v.ord - 'A'.ord + base_time + 1
          dag.delete(v)
        end
      end
  end
  ticks
end
