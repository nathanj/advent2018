def dist(x, y, a, b)
  return (x - a).abs + (y - b).abs
end

def find_closest_point(x, y, points)
  mindist = points.min_of { |v| dist(x, y, v[0], v[1]) }
  index = -1
  points.each_with_index do |p, i|
    d = dist(x, y, p[0], p[1])
    if d == mindist
      if index == -1
        index = i
      else
        return -1
      end
    end
  end
  index
end

def is_within_region(x, y, points, region_size)
  points.map { |p| dist(x, y, p[0], p[1]) }.sum < region_size
end

def print_grid(grid)
  (0...grid.size).each do |y|
    (0...grid.size).each do |x|
      if grid[y][x] == -1
        printf "*"
      else
        printf "%d", grid[y][x]
      end
    end
    puts
  end
end

def find_infinite_areas(grid)
  infinite = [] of Int32
  infinite = infinite + grid[0]
  infinite = infinite + grid[grid.size - 1]
  grid.each do |row|
    infinite << row[0]
    infinite << row[row.size - 1]
  end
  infinite.uniq
end

def compute_area(points)
  max = points.max_by { |v| v[0] > v[1] ? v[0] : v[1] }.max + 10
  grid = Array.new(max) { Array.new(max) { 0 } }
  (0...max).each do |x|
    (0...max).each do |y|
      grid[y][x] = find_closest_point(x, y, points)
    end
  end
  indexes = (0...points.size).to_a
  infinite = find_infinite_areas(grid)
  closed = indexes - infinite
  # print_grid(grid)
  closed.map { |v| grid.map { |row| row.count { |w| w == v } }.sum }.max
end

def compute_area_part2(points, region_size)
  max = points.max_by { |v| v[0] > v[1] ? v[0] : v[1] }.max + 10
  grid = Array.new(max) { Array.new(max) { 0 } }
  (0...max).each do |x|
    (0...max).each do |y|
      grid[y][x] = is_within_region(x, y, points, region_size) ? 1 : 0
    end
  end
  # print_grid(grid)
  grid.map { |row| row.sum }.sum
end
