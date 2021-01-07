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
    @exhibits.any? do |exhibit|
      if patron.spending_money < exhibit.cost
        @patrons.push(patron)
      else
        @patrons.push(patron)
      end
    end
  end

  def patrons_by_exhibit_interest
    @exhibits.group_by do |exhibit|
      exhibit
    end
  end
end
