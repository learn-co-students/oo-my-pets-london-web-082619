class Owner
  attr_reader :name, :species
  attr_accessor :mood

  @@all = []

  def initialize(name)
    @name = name 
    @species = "human"
    @@all << self
  end

  def say_species
    "I am a #{self.species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all.clear
  end

  def cats
    Cat.all.select {|cat|cat.owner == self}
  end

  def dogs
    Dog.all.select {|dog|dog.owner == self}
  end

  def buy_cat(name)
    new_cat = Cat.new(name, self)
  end

  def buy_dog(name)
    new_dog = Dog.new(name, self)
  end
#creates a new intsance of dog and passes self (the owner upon which the method is called) as argument, since the dog and cat classes expect that in their initialize: def initialize(name, owner)

  def walk_dogs
    self.dogs.each {|dog|dog.mood = "happy"}
  end
  #this calls on the earlier defined method of 'dogs', iterates over all the dogs in the @@all array of the Dog class (as written in the 'dogs' method earlier in this class) and instead of returning something, like .select returns an array, it is changing the .mood of each dog to "happy"

  def feed_cats
    self.cats.each {|cat|cat.mood = "happy"}
  end

  def sell_pets
    pets = self.dogs + self.cats 

    pets.each do |pet|
      pet.mood = "nervous"
      pet.owner = nil
    end
  end
  #this creates a variable to group all the cat and dog instances that are associated with the owner that the method is called on. Then it iterates over each and reassings the mood, and nils the ownership

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end