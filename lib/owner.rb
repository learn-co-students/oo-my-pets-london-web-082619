class Owner
  @@all = []

  attr_reader :species, :name

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species()
    "I am a #{self.species}."
  end

  def self.all()
    @@all
  end

  def self.count()
    @@all.length
  end

  def self.reset_all()
    @@all.clear
  end

  def cats()
    Cat.all.select { |cat| cat.owner == self }
  end

  def dogs()
    Dog.all.select { |dog| dog.owner == self }
  end

  def buy_cat(name)
    new_cat = Cat.new(name, self)
  end

  def buy_dog(name)
    new_dog = Dog.new(name, self)
  end

  def walk_dogs()
    dogs().each { |dog| dog.mood = "happy" }
  end

  def feed_cats()
    cats().each { |cat| cat.mood = "happy" }
  end

  def sell_pets()
    pets = dogs() + cats()
    pets.each do | pet |
      pet.mood = "nervous"
      pet.owner = nil
    end
  end

  def list_pets()
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end