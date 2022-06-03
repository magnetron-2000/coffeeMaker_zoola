class Coffeemaker_creator
  def factory_method
    raise NotImplementedError, "#{self.class} have not implement factory method"
  end

  def make_coffee
    coffee = factory_method
    "take you #{coffee.taste}"
  end
end

class Coffeemaker_for_shop < Coffeemaker_creator
  def factory_method
    Capuchino.new
  end
end

class Coffeemaker_for_home < Coffeemaker_creator
  def factory_method
    Coffee.new
  end
end

class Coffeemaker_for_job < Coffeemaker_creator
  def factory_method
    Strongcoffee.new
  end
end

class Product
  def taste
    raise NotImplementedError, "#{self.class} have not implement taste method"
  end
end

class Capuchino < Product
  def taste
    'sweet capuchino'
  end
end

class Coffee < Product
  def taste
    'bitter coffee'
  end
end

class Strongcoffee < Product
  def taste
    'super bitter coffee'
  end
end

def call(creator)
  p "#{creator.make_coffee}"
end

loop do
  puts 'enter the product name or q'
  name = gets.chomp
  case name
  when 'q' then break
  when 'coffee' then call(Coffeemaker_for_home.new)
  when 'capuchino' then call(Coffeemaker_for_shop.new)
  when 'strong' then call(Coffeemaker_for_job.new)
  end
end

