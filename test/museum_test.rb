require 'minitest/autorun'
require 'minitest/pride'
require './lib/exhibit'
require './lib/patron'
require './lib/museum'


class MuseumTest < Minitest::Test

  def test_it_exists_with_attributes
    dmns = Museum.new("Denver Museum of Nature and Science")

    assert_instance_of Museum, dmns
    assert_equal "Denver Museum of Nature and Science", dmns.name
  end

  def test_it_has_no_exhibits_at_first
    dmns = Museum.new("Denver Museum of Nature and Science")

    assert_equal [], dmns.exhibits
  end

  def test_it_can_add_exhibits
    dmns = Museum.new("Denver Museum of Nature and Science")
    gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
    dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
    imax = Exhibit.new({name: "IMAX",cost: 15})

     dmns.add_exhibit(gems_and_minerals)
     dmns.add_exhibit(dead_sea_scrolls)
     dmns.add_exhibit(imax)

    assert_equal [gems_and_minerals, dead_sea_scrolls, imax], dmns.exhibits
  end
end


# pry(main)> patron_1 = Patron.new("Bob", 20)
# # => #<Patron:0x00007fb400a51cc8...>
#
# pry(main)> patron_1.add_interest("Dead Sea Scrolls")
#
# pry(main)> patron_1.add_interest("Gems and Minerals")
#
# pry(main)> patron_2 = Patron.new("Sally", 20)
# # => #<Patron:0x00007fb400036338...>
#
# pry(main)> patron_2.add_interest("IMAX")
#
# pry(main)> dmns.recommend_exhibits(patron_1)
# # => [#<Exhibit:0x00007fb400bbcdd8...>, #<Exhibit:0x00007fb400b851f8...>]
#
# pry(main)> dmns.recommend_exhibits(patron_2)
# # => [#<Exhibit:0x00007fb400acc590...>]
