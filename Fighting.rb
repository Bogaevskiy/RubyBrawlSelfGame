class Fighter
  attr_accessor :name, :health, :mindamage, :maxdamage

  def initialize(name, health, mindamage, maxdamage)
    @name = name
    @health = health
    @mindamage = mindamage
    @maxdamage = maxdamage
  end

  def hit
    @hit = mindamage + rand(maxdamage - mindamage + 1)
  end
  
  def start
    puts "#{name} has #{health} hp and deals #{mindamage}-#{maxdamage} damage"
  end
end

def round(fighter1, fighter2)
  hit1 = fighter1.hit
  hit2 = fighter2.hit
  puts "#{fighter1.name} hits #{fighter2.name} for #{hit1} damage"
  puts "#{fighter2.name} hits #{fighter1.name} for #{hit2} damage"
  fighter1.health = fighter1.health - hit2
  fighter2.health = fighter2.health - hit1
  puts "Now #{fighter1.name} has #{fighter1.health}hp and #{fighter2.name} has #{fighter2.health}hp"
  sleep 3
  puts "----------"
end

def victory(fighter1, fighter2)
  if fighter1.health > 0
    puts "#{fighter2.name} is dead, #{fighter1.name} has won!"
  elsif fighter2.health > 0
    puts "#{fighter1.name} is dead, #{fighter2.name} has won!"
  end
  if fighter1.health <= 0 and fighter2.health <= 0
    puts "Both #{fighter1.name} and #{fighter2.name} are dead. It's a draw!"
  end
end

def story(fighter1, fighter2)
  case rand(4)
  when 0
    puts "#{fighter1.name} and #{fighter2.name} have met each other in the forest"
  when 1
    puts "#{fighter1.name} and #{fighter2.name} had a drunk conflict at the bar"
  when 2
    puts "#{fighter1.name} doesn't agree with philosophical position of #{fighter2.name}"
  when 3
    puts "Both #{fighter1.name} and #{fighter2.name} want the same last thing at the shop"
  when 4
    puts "Nobody knows why, but #{fighter1.name} and #{fighter2.name} start to fight!"
  end  
end

def rumble(fighter1, fighter2)
  story(fighter1, fighter2)
  fighter1.start
  fighter2.start
  sleep 3
  puts "----------"
  while fighter1.health > 0 and fighter2.health > 0
    round(fighter1, fighter2)
  end
  victory(fighter1, fighter2)
end

knight = Fighter.new("Knight", 20, 3, 5)
goblin = Fighter.new("Goblin", 20, 2, 6)
troll = Fighter.new("Troll", 30, 1, 5)
rumble(knight, goblin)
a = gets
