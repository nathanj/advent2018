class Node
  property children : Array(Node) = [] of Node
  property metadata : Array(Int32) = [] of Int32
end

def parse_tree(nums, loc = 0, node = Node.new)
  consumed = 0
  num_children = nums[loc]
  num_metadata = nums[loc + 1]
  consumed += 2
  num_children.times do |v|
    child = Node.new
    consumed += parse_tree(nums, loc + consumed, child)
    node.children << child
  end
  num_metadata.times do |v|
    node.metadata << nums[loc + consumed]
    consumed += 1
  end
  consumed
end

def parse_tree_str(str)
  nums = str.split(" ").map &.to_i
  tree = Node.new
  parse_tree(nums, node: tree)
  tree
end

def sum_metadata(node) : Int32
  return node.metadata.sum +
    node.children.map { |c| sum_metadata(c).as(Int32) }.sum
end

def sum_metadata_part2(node) : Int32
  if node.children.size == 0
    node.metadata.sum
  else
    node.metadata.map do |v|
      if v == 0
        0
      elsif v - 1 < node.children.size
        sum_metadata_part2(node.children[v - 1])
      else
        0
      end
    end.sum
  end
end
