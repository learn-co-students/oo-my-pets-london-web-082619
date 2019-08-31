class Owner
  attr_reader :name,:species
 @@all = []
  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
    

  end

  def say_species 
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
 
  def cats ()
    Cat.all.select{|cat| cat.owner == self }
  end

  def dogs()
    Dog.all.select{ |dog| dog.owner == self }
  end

  def buy_cat(cat_name)
    Cat.new(cat_name, self)
    end

    def buy_dog(dog_name)
      Dog.new(dog_name, self)
  end

  def walk_dogs()
    self.dogs.each do |dog|
      dog.mood = "happy"
   end
end 
 def feed_cats 
  self.cats.each do |cat|
    cat.mood = "happy"
    end
  end
  def sell_pets
    Cat.all.select{ |cat| cat.owner == self }.each{ |cat| cat.mood = "nervous"}
    Dog.all.select{ |dog| dog.owner == self }.each {|dog| dog.mood = "nervous"}
  #owner.sell_pets and owner to be nill 

    Cat.all.select{ |cat| cat.owner == self }.each{ |cat| cat.owner = nil}
    Dog.all.select{ |dog| dog.owner == self }.each{ |dog| dog.owner = nil}

  end
  
    def list_pets 
    "I have #{self.dogs.count} dog(s), and #{self.dogs.count} cat(s)."
  end
end