record Rect,
  x : Int32, y : Int32,
  w : Int32, h : Int32

record Claim,
  id : Int32,
  rect : Rect

def parse_claim(str)
  /#(\d+) @ (\d+),(\d+): (\d+)x(\d+)/ =~ str
  return Claim.new($1.to_i, Rect.new($2.to_i, $3.to_i, $4.to_i, $5.to_i))
end

def find_duplicate_claims(inputs)
  fabric = Array.new(1000) { Array.new(1000) { 0 } }
  inputs.each do |claim|
    rect = claim.rect
    rect.h.times do |y|
      rect.w.times do |x|
        fabric[rect.y + y][rect.x + x] += 1
      end
    end
  end
  return fabric.map { |row| row.count { |x| x > 1 } }.sum
end

def find_nonoverlapping_claim(inputs)
  fabric = Array.new(1000) { Array.new(1000) { 0 } }
  inputs.each do |claim|
    rect = claim.rect
    rect.h.times do |y|
      rect.w.times do |x|
        fabric[rect.y + y][rect.x + x] += 1
      end
    end
  end
  inputs.each do |claim|
    foundit = true
    rect = claim.rect
    rect.h.times do |y|
      rect.w.times do |x|
        if fabric[rect.y + y][rect.x + x] > 1
          foundit = false
        end
      end
    end
    if foundit
      return claim
    end
  end
end
