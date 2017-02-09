class Owner
  # code goes here

  #@@counter = 0
  OWNERS = []
  attr_accessor :name, :pets
  attr_reader :species

  def initialize(species)
    #@name = name
    @species = species
    OWNERS << self
    @pets = {:fishes => [], :dogs => [], :cats => []}
  end

  def self.all
    return OWNERS
  end

  def self.count
    OWNERS.length
    #@counter
  end

  #reset the owners constant if run
  def self.reset_all
    OWNERS.clear
  end

  def buy_fish(name)
    fish = Fish.new(name)
    owner = self
    pets[:fishes] << fish
  end

  def buy_cat(name)
    cat = Cat.new(name)
    owner = self
    pets[:cats] << cat
  end

  def buy_dog(name)
    dog = Dog.new(name)
    owner = self
    pets[:dogs] << dog
  end

  def walk_dogs
    self.pets[:dogs].each do |pet|
      pet.mood = "happy"
    end
  end

  def play_with_cats
    self.pets[:cats].each do |pet|
      pet.mood = "happy"
    end
  end

  def feed_fish
    fish = self.pets[:fishes]
    fish.each do |pet|
      pet.mood = "happy"
    end
  end

  def say_species
    "I am a #{species}."
  end

  def sell_pets
    self.pets.each do |k,v|
      v.each do |pet|
        pet.mood = "nervous"
      end
      v.clear
    end
  end

  def list_pets
    cats = self.pets[:cats].count
    dogs = self.pets[:dogs].count
    fishes = self.pets[:fishes].count
    "I have #{fishes} fish, #{dogs} dog(s), and #{cats} cat(s)."
  end
end
