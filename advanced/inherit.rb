class Weapon

  def initialize(damage, distance, recharge_time, magazine, max_magazine)
    @damage, @distance, @recharge_time, @magazine, @max_magazine =
      damage, distance, recharge_time, magazine, max_magazine
  end

  def damage(real_distance, goal)
    if real_distance < @distance
      dam = @damage * (@distance/real_distance) * 0.1
    else
      p "miss!"
    end
    @magazine -= 1
    dam
  end

  def recharge_or_reuse
    puts "wait a #{@recharge_time} second"
    sleep(@recharge_time)
    @magazine = @max_magazine
    puts "weapon is ready"
  end

end

class Cold_steel < Weapon

  def initialize(damage)
    super(damage, distance=0.99, recharge_time=1, magazine=1, max_magazine=1)
  end

  def clean
    puts 'weapon is clean!'
  end
end

class Firearm < Weapon

  def damage(real_distance, goal)
    dam = super(real_distance, goal)
    dam * rand
  end

end

class Explosive < Weapon

  def initialize(damage, distance)
    super(damage, distance, recharge_time=1, magazine=1, max_magazine=1)
  end

  def damage(real_distance, goal)
    super
    p "EXPLOOOOOSIION"
  end

end

class Goal
  attr_accessor :hp
  def initialize(hp)
    @hp = hp
  end
end

goal = Goal.new(100)

puts "Cold steel".center(20,'-')
cold = Cold_steel.new(5)
cold.damage(1,goal)
cold.damage(4, goal)

puts "Firearm".center(20,'-')
gun = Firearm.new(3, 6,2,8,8)
gun.recharge_or_reuse
gun.damage(4,goal)

puts "Explosive".center(20,'-')
exp = Explosive.new(20, 22)
exp. damage(8, goal)