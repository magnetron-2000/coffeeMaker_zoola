class Creator #choices
  def self.choice(type)
    case type
    when 'coffee' then Coffee.new
    when 'capuchino' then Capuchino.new
    when 'latte' then Latte.new
    end
  end
end

# super class for products and showing them state
class Drinks
  def initialize
    @freshness = Time.new
    @tasty = true
  end

  def take(take)
    if take == 'take'
      t = Time.new - @freshness
      if t > 15
        @tasty = false
        puts 'your order is  already cold'
      end
    end
  end
end

# class what make a different things(drinks) depending on the cod
class Coffee < Drinks
  @@busy = false
  attr_accessor :busy
  def make
    @@busy = true
    puts ' '.center(20, '$')
    puts 'wait a second'
    puts 'making great coffee...'
    sleep(2)
    puts 'take coffee please(input - take)'
    take(gets.chomp)
    puts
    @@busy = false
    end
end

class Capuchino < Drinks
  @@busy = false
  attr_accessor :busy
  def make
    @@busy = true
    puts ' '.center(20, '$')
    puts 'wait a second'
    puts 'making great capuchino...'
    sleep(2)
    puts 'take capuchino please(input - take)'
    take(gets.chomp)
    puts
    @@busy = false
  end
end

class Latte < Drinks
  @@busy = false
  attr_accessor :busy
  def make
    @@busy = true
    puts ' '.center(20, '$')
    puts 'wait a second'
    puts 'making great latte...'
    sleep(2)
    puts 'take latte please(input - take)'
    take(gets.chomp)
    puts
    @@busy = false
  end
end

# method for users
def call(type)
  Creator.choice(type).make
end

loop do # user's interface
  puts '-'.center(40, '-')
  puts 'enter the product name or q'.center(40, '-')
  puts 'drinks: coffee, capuchino, latte '.center(40, '-')
  name = gets.chomp
  case name
  when 'q' then break
  when 'coffee' then call('coffee')
  when 'capuchino' then call('capuchino')
  when 'latte' then call('latte')
  else
    puts 'wrong data'.center(40, '-')
  end
end

