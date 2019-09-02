class Owner
  attr_reader :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def species
    "human"
  end

  def say_species
      "I am a human."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all.clear
  end

  def cats
    Cat.all.select{|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select{|dog| dog.owner == self}
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    dogs.each{|dog| dog.mood = "happy"}
  end

  def feed_cats
    cats.each{|cat| cat.mood= "happy"}
  end

  def sell_pets
    cats.each{|cat| cat.mood = "nervous"}
    dogs.each{|dog| dog.mood = "nervous"}
    cats.each{|cat| cat.owner = nil}
    dogs.each{|dog| dog.owner = nil}
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end
