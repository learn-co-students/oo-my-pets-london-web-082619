class Owner
  # code goes here
  attr_reader :name, :species, :say_species
  @@all = []
  def initialize(name)
    @name = name
    @species = "human"
    @say_species = "I am a human."
    @@all << self
  end

  def self.all
    @@all
  end
  
  def self.count
    self.all.count
  end

  def self.reset_all
    self.all.clear
  end

  # Associations
  def cats
    Cat.all.select{|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select{|dog| dog.owner == self}
  end

  def buy_cat(cat_name)
    # current_cat = Cat.all.find{|cat| cat.name == cat_name}
    # current_cat.owner = self
    # binding.pry
    Cat.new(cat_name, self)
  end

  def buy_dog(dog_name)
    Dog.new(dog_name, self)
  end

  def walk_dogs
    # self.dogs.each {|dog| dog.mood = "happy"}
    dogs_moods("happy")
  end

  def feed_cats
    # self.cats.each{|cat| cat.mood = "happy"}
    cats_moods("happy")
  end

  def sell_pets
    cats_moods("nervous")
    dogs_moods("nervous")
    dogs.each{|dog| dog.owner = nil}
    cats.each{|cat| cat.owner = nil}
  end

  def cats_moods(mood)
    self.cats.each{|cat| cat.mood = mood}
  end

  def dogs_moods(mood)
    self.dogs.each{|dog| dog.mood = mood}
  end

  def list_pets
    "I have #{dogs.length} dog(s), and #{cats.count} cat(s)."
  end
end





