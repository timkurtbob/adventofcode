input = ['L3', 'R2', 'L5', 'R1', 'L1', 'L2', 'L2', 'R1', 'R5', 'R1', 'L1', 'L2',
  'R2', 'R4', 'L4', 'L3', 'L3', 'R5', 'L1', 'R3', 'L5', 'L2', 'R4', 'L5', 'R4',
  'R2', 'L2', 'L1', 'R1', 'L3', 'L3', 'R2', 'R1', 'L4', 'L1', 'L1', 'R4', 'R5',
  'R1', 'L2', 'L1', 'R188', 'R4', 'L3', 'R54', 'L4', 'R4', 'R74', 'R2', 'L4',
  'R185', 'R1', 'R3', 'R5', 'L2', 'L3', 'R1', 'L1', 'L3', 'R3', 'R2', 'L3',
  'L4', 'R1', 'L3', 'L5', 'L2', 'R2', 'L1', 'R2', 'R1', 'L4', 'R5', 'R4', 'L5',
  'L5', 'L4', 'R5', 'R4', 'L5', 'L3', 'R4', 'R1', 'L5', 'L4', 'L3', 'R5', 'L5',
  'L2', 'L4', 'R4', 'R4', 'R2', 'L1', 'L3', 'L2', 'R5', 'R4', 'L5', 'R1', 'R2',
  'R5', 'L2', 'R4', 'R5', 'L2', 'L3', 'R3', 'L4', 'R3', 'L2', 'R1', 'R4', 'L5',
  'R1', 'L5', 'L3', 'R4', 'L2', 'L2', 'L5', 'L5', 'R5', 'R2', 'L5', 'R1', 'L3',
  'L2', 'L2', 'R3', 'L3', 'L4', 'R2', 'R3', 'L1', 'R2', 'L5', 'L3', 'R4', 'L4',
  'R4', 'R3', 'L3', 'R1', 'L3', 'R5', 'L5', 'R1', 'R5', 'R3', 'L1']

t1 = ['R2', 'L3']
t2 = ['R2', 'R2', 'R2']
t3 = ['R5', 'L5', 'R5', 'R3']

def distance(i)
  f = 'N'               # currently facing direction
  dx = 0                # distance on x axis
  dy = 0                # distance on y axis

  i.each do  |e|
    td = e[0]           # direction to turn to
    dis = e[1].to_i     # distance to go

    f = new_dir(f, td)

    if f == 'N' || f == 'S'
      dx += new_dis(f, dis)
    elsif f == 'E' || f == 'W'
      dy += new_dis(f, dis)
    end

  end

  p dis_comb(dx, dy)

end


def new_dis(f, dis)   # direction and distance
  if f == 'N' || f == 'E'
    return dis
  else
    return dis * -1
  end
end


def new_dir(od, td)    # old direction and turn direction
  if    od == 'N' && td == 'L' || od == 'S' && td == 'R'
    return 'W'
  elsif od == 'N' && td == 'R' || od == 'S' && td == 'L'
    return 'E'
  elsif od == 'E' && td == 'L' || od == 'W' && td == 'R'
    return 'N'
  elsif od == 'E' && td == 'R' || od == 'W' && td == 'L'
    return 'S'
  end
end


def dis_comb(dx, dy)
  if dx < 0
    dx = dx * -1
  end
  if dy < 0
    dy = dy * -1
  end

  return dx + dy
end


p t1
distance(t1)
p t2
distance(t2)
p t3
distance(t3)

p 'input array'
distance(input)

## CHECK FOR new_dir METHOD

# s = 'South'
# n = 'North'
# w = 'West'
# e = 'East'

# p 'check direction'
# p n
# p new_dir('E', 'L')

# p s
# p new_dir('E', 'R')

# p n
# p new_dir('W', 'R')

# p s
# p new_dir('W', 'L')

# p w
# p new_dir('N', 'L')

# p e
# p new_dir('N', 'R')

# p w
# p new_dir('S', 'R')

# p e
# p new_dir('S', 'L')

