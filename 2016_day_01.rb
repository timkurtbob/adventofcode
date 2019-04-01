input = %w[
  L3 R2 L5 R1 L1 L2 L2 R1 R5 R1 L1 L2 R2 R4 L4 L3 L3 R5 L1 R3 L5 L2 R4 L5 R4 R2
  L2 L1 R1 L3 L3 R2 R1 L4 L1 L1 R4 R5 R1 L2 L1 R188 R4 L3 R54 L4 R4 R74 R2 L4
  R185 R1 R3 R5 L2 L3 R1 L1 L3 R3 R2 L3 L4 R1 L3 L5 L2 R2 L1 R2 R1 L4 R5 R4 L5
  L5 L4 R5 R4 L5 L3 R4 R1 L5 L4 L3 R5 L5 L2 L4 R4 R4 R2 L1 L3 L2 R5 R4 L5 R1 R2
  R5 L2 R4 R5 L2 L3 R3 L4 R3 L2 R1 R4 L5 R1 L5 L3 R4 L2 L2 L5 L5 R5 R2 L5 R1 L3
  L2 L2 R3 L3 L4 R2 R3 L1 R2 L5 L3 R4 L4 R4 R3 L3 R1 L3 R5 L5 R1 R5 R3 L1
]

t1 = %w[R2 L3]
t2 = %w[R2 R2 R2]
t3 = %w[R5 L5 R5 R3]
t4 = %w[R8 R4 R4 R8]

# distance to the last point
def distance(array)
  orientation = 'N'
  position = [0, 0]

  array.each do |e|
    turn = e[0]
    distance = calc_distance(e)
    orientation = new_dir(orientation, turn)
    position = jump_to_new_position(orientation, position, distance)
  end

  print 'Distance to last position: '
  p dis_comb(position)
end

# distance to first intersection
def distance_sc(array)
  orientation = 'N'
  position = [0, 0]
  loc_history = loc_history(orientation, position, array)
  first_intersection = find_first_intersection(loc_history)

  if first_intersection.empty?
    puts 'This path has no intersections.'
  else
    print 'Distance to first intersection: '
    p dis_comb(first_intersection.keys[0])
  end
end

def calc_distance(direction)
  s = ''
  c = 1
  while c < direction.length
    s.insert(-1, direction[c])
    c += 1
  end
  s.to_i
end

# old direction and turn direction
def new_dir(old, turn)
  if    old == 'N' && turn == 'L' || old == 'S' && turn == 'R'
    'W'
  elsif old == 'N' && turn == 'R' || old == 'S' && turn == 'L'
    'E'
  elsif old == 'E' && turn == 'L' || old == 'W' && turn == 'R'
    'N'
  elsif old == 'E' && turn == 'R' || old == 'W' && turn == 'L'
    'S'
  end
end

def jump_to_new_position(orientation, position, distance)
  if %w[N S].include?(orientation)
    position[0] += new_dis(orientation, distance)
  else
    position[1] += new_dis(orientation, distance)
  end
  position
end

# direction and distance
def new_dis(orientation, distance)
  if %w[N E].include?(orientation)
    distance
  else
    distance * -1
  end
end

# storing location history
def loc_history(orientation, position, array)
  loc_history = []
  array.each do |e|
    turn = e[0]
    distance = calc_distance(e)
    orientation = new_dir(orientation, turn)
    distance.times do
      position = step_to_new_position(orientation, position)
      loc_history << position.dup
    end
  end
  loc_history
end

def step_to_new_position(orientation, position)
  if %w[N S].include?(orientation)
    position[0] += new_dis(orientation, 1)
  else
    position[1] += new_dis(orientation, 1)
  end
  position
end

def find_first_intersection(loc_history)
  lh_hash = Hash[loc_history.group_by { |x| x }.map { |k, v| [k, v.count] }]
  lh_hash.select { |_k, v| v > 1 }
end

def dis_comb(position)
  position[0].negative? && position[0] *= -1
  position[1].negative? && position[1] *= -1
  position[0] + position[1]
end

print 'Test Array 01: '
p t1
distance(t1)
distance_sc(t1)

print 'Test Array 02: '
p t2
distance(t2)
distance_sc(t2)

print 'Test Array 03: '
p t3
distance(t3)
distance_sc(t3)

print 'Test Array 03: '
p t4
distance(t4)
distance_sc(t4)

p 'INPUT ARRAY'
distance(input)
distance_sc(input)
