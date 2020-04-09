class Drink
  attr_reader :name, :price

  def self.cola
    self.new :cola, 120
  end

  def self.redbull
    self.new :redbull, 200
  end

  def self.water
    self.new :water, 100
  end

  def initialize (name, price)
    @name = name
    @price = price
  end

end
