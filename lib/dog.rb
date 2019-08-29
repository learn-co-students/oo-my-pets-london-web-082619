class Dog
  
  @@all = []

  attr_accessor :mood, :owner
  attr_reader :name

  def initialize(name, owner) #Dog.new
    @name = name
    @owner = owner
    @mood = "nervous"
    @@all << self
  end

  def self.all
    @@all
  end

  def dogs #owner.dogs
    #returns a a collection of all the dogs that belong to the owner
    Dog.all.select { |dog| dog.owner == self }
  end

end