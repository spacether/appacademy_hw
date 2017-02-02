# homework per https://github.com/appacademy/curriculum/blob/master/ruby/homeworks/questions/big_octopus.md
# Justin Black
# 2017-02-01

mult = 500
arr = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
arr *= mult

def time_diff_sec(start, finish)
  (finish - start)
end

# sluggish octopus, n^2 time
def nsquared(arr)
  best = arr[0]
  arr.each do |first_fish|
    arr.each do |second_fish|
      bigger_than_sec = first_fish.length > second_fish.length
      if bigger_than_sec && first_fish.length > best.length
        best = first_fish
      end
    end
  end
  best
end

before = Time.now
best = nsquared(arr)
runtime = time_diff_sec(before, Time.now)
#p best
puts "N**2 search, run-time: #{runtime} seconds"



# dominant octopus, n*log(n)

#mege sort is n*log(n)
def msort(arr, &prc)
  return arr if arr.length < 2
  prc ||= Proc.new { |x, y| x <=> y }
  num = arr.size / 2
  left = msort(arr.take(num), &prc)
  right = msort(arr.drop(num), &prc)
  merge(left, right, &prc)
end

def merge(left, right, &prc)
  res = []
  until left.empty? || right.empty?
    compareval = prc.call(left.first, right.first)
    res << (compareval < 1 ? left.shift : right.shift)
  end
  res.concat(left)
  res.concat(right)
end

before = Time.now
best = msort(arr) { |x, y| x.length <=> y.length }
best = best.last
#p best
runtime = time_diff_sec(before, Time.now)
puts "N*LOG(N) search, run-time: #{runtime} seconds"

# clever octopus, N time
def ntime(arr)
  best = arr.shift
  arr.each do |fish|
    best = fish if fish.length > best.length
  end
  best
end

before = Time.now
best = ntime(arr)
#p best
runtime = time_diff_sec(before, Time.now)
puts "N search, run-time: #{runtime} seconds"


# octopus dance dance revolution

tiles_array = [
  "up", "right-up", "right", "right-down",
  "down", "left-down", "left", "left-up"
]

steps = tiles_array.shuffle * mult

def slow_dance(dirstr, dirs)
  dirs.each_with_index { |dir, i| return i if dir == dirstr }
end

before = Time.now
steps.each { |step| slow_dance(step, tiles_array) }
runtime = time_diff_sec(before, Time.now)
puts "N time, ocotopus slow dance, run-time: #{runtime} seconds"

moves_hash = {
  'up' => 0,
  'right-up' => 1,
  'right' => 2,
  'right-down' => 3,
  'down' => 4,
  'left-down' => 5,
  'left' => 6,
  'left-up' => 7
}

def fast_dance(key, dict)
  dict[key]
end

before = Time.now
steps.each { |step| fast_dance(step, moves_hash) }
runtime = time_diff_sec(before, Time.now)
puts "O(1) time, ocotopus fast dance, run-time: #{runtime} seconds"
