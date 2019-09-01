class Owner
  attr_accessor
  attr_reader :species, :name

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    self.class.all << self
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
    Cat.all.select {|c| c.owner == self}
  end

  def dogs
    Dog.all.select {|d| d.owner == self}
  end

  def buy_cat(cat_name)
    cat = Cat.new(cat_name, self)
  end

  def buy_dog(dog_name)
    dog = Dog.new(dog_name, self)
  end

  def walk_dogs
    self.dogs.each do |d| d.mood = "happy"
    end
  end

  def feed_cats
    self.cats.each do |c| c.mood = "happy"
    end
  end

  def sell_pets
    self.cats.each do |c| c.mood = "nervous"; c.owner = nil
    end

    self.dogs.each do |d| d.mood = "nervous"; d.owner = nil
    end
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end