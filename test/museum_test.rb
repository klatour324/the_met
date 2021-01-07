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

  def test_it_can_reccommend_exhibit_to_patron_if_patron_is_interested
    dmns = Museum.new("Denver Museum of Nature and Science")
    gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
    dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
    imax = Exhibit.new({name: "IMAX",cost: 15})
    patron_1 = Patron.new("Bob", 20)
    patron_2 = Patron.new("Sally", 20)

     dmns.add_exhibit(gems_and_minerals)
     dmns.add_exhibit(dead_sea_scrolls)
     dmns.add_exhibit(imax)

      patron_1.add_interest("Dead Sea Scrolls")
      patron_1.add_interest("Gems and Minerals")
      patron_2.add_interest("IMAX")

      assert_equal [dead_sea_scrolls, gems_and_minerals], dmns.recommend_exhibits(patron_1)
      assert_equal [imax], dmns.recommend_exhibits(patron_2)
  end
end



# pry(main)> dmns = Museum.new("Denver Museum of Nature and Science")
# # => #<Museum:0x00007fb20205d690...>
#
# pry(main)> gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
# # => #<Exhibit:0x00007fb202238618...>
#
# pry(main)> dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
# # => #<Exhibit:0x00007fb202248748...>
#
# pry(main)> imax = Exhibit.new({name: "IMAX",cost: 15})
# # => #<Exhibit:0x00007fb20225f8d0...>
#
# pry(main)> dmns.add_exhibit(gems_and_minerals)
#
# pry(main)> dmns.add_exhibit(dead_sea_scrolls)
#
# pry(main)> dmns.add_exhibit(imax)
#
# pry(main)> dmns.patrons
# # => []
#
# pry(main)> patron_1 = Patron.new("Bob", 0)
# # => #<Patron:0x00007fb2011455b8...>
#
# pry(main)> patron_1.add_interest("Gems and Minerals")
#
# pry(main)>
# patron_1.add_interest("Dead Sea Scrolls")
#
# pry(main)> patron_2 = Patron.new("Sally", 20)
# # => #<Patron:0x00007fb20227f8b0...>
#
# pry(main)> patron_2.add_interest("Dead Sea Scrolls")
#
# pry(main)> patron_3 = Patron.new("Johnny", 5)
# # => #<Patron:0x6666fb20114megan...>
#
# pry(main)> patron_3.add_interest("Dead Sea Scrolls")
#
# pry(main)> dmns.admit(patron_1)
#
# pry(main)> dmns.admit(patron_2)
#
# pry(main)> dmns.admit(patron_3)
#
# pry(main)> dmns.patrons
# # => [#<Patron:0x00007fb2011455b8...>, #<Patron:0x00007fb20227f8b0...>, #<Patron:0x6666fb20114megan...>]
#
# #Patrons are added even if they don't have enough money for all/any exhibits.
#
# pry(main)> dmns.patrons_by_exhibit_interest
# # =>
# # {
# #   #<Exhibit:0x00007fb202238618...> => [#<Patron:0x00007fb2011455b8...>],
# #   #<Exhibit:0x00007fb202248748...> => [#<Patron:0x00007fb2011455b8...>, #<Patron:0x00007fb20227f8b0...>, #<Patron:0x6666fb20114megan...>],
# #   #<Exhibit:0x00007fb20225f8d0...> => []
# # }
#
# pry(main)> dmns.ticket_lottery_contestants(dead_sea_scrolls)
# # => [#<Patron:0x00007fb2011455b8...>, #<Patron:0x6666fb20114megan...>]
#
# pry(main)> dmns.draw_lottery_winner(dead_sea_scrolls)
# # => "Johnny" or "Bob" can be returned here. Fun!
#
# pry(main)> dmns.draw_lottery_winner(gems_and_minerals)
# # => nil
#
# #If no contestants are elgible for the lottery, nil is returned.
#
# pry(main)> dmns.announce_lottery_winner(imax)
# # => "Bob has won the IMAX edhibit lottery"
#
# # The above string should match exactly, you will need to stub the return of `draw_lottery_winner` as the above method should depend on the return value of `draw_lottery_winner`.
#
# pry(main)> dmns.announce_lottery_winner(gems_and_minerals)
# # => "No winners for this lottery"
#
# # If there are no contestants, there are no winners.
# ```
