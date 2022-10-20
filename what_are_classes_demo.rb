class Adventurer
  def walk
    puts "Walks along for a while"
  end

  def use_potion
    puts "Healed 20 HP"
  end
end

# Create an instance of the Adventurer class which gives us an object.
frodo = Adventurer.new

# Wse instance methods from the Adventurer class
frodo.walk
frodo.use_potion

# Inheritance
class Mage < Adventurer
  def fireball_attack
    puts "Deals 30 points of fire damage"
  end

  def walk # overwrite .walk from Adventurer
    puts "Walks along slowly with staff"
  end
end

gandalf = Mage.new

gandalf.walk
gandalf.fireball_attack
