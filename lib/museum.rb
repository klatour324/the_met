class Museum
  attr_reader :name,
              :exhibits,
              :patrons

  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
  end

  def add_exhibit(exhibit)
    exhibits.push(exhibit)
  end

  def recommend_exhibits(patron)
     @exhibits.find_all do |exhibit|
      patron.interests.include?(exhibit.name)
    end.reverse
  end

  def admit(patron)
    @patrons.push(patron)
  end
end
