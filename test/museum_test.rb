require 'minitest/autorun'
require 'minitest/pride'
require './lib/museum'
require './lib/patron'
require './lib/exhibit'

class MuseumTest < Minitest::Test
  def test_intance
    dmns = Museum.new("Denver Museum of Nature and Science")
    assert_instance_of Museum, dmns
  end
  def test_name
    dmns = Museum.new("Denver Museum of Nature and Science")
    assert_equal "Denver Museum of Nature and Science", dmns.name
  end
  def test_exhibits
    dmns = Museum.new("Denver Museum of Nature and Science")
    assert_equal [], dmns.exhibits
  end
  def test_it_can_add_exhibition
    dmns = Museum.new("Denver Museum of Nature and Science")
    gems_and_minerals = Exhibit.new("Gems and Minerals", 0)
    dead_sea_scrolls = Exhibit.new("Dead Sea Scrolls", 10)
    imax = Exhibit.new("IMAX", 15)
    dmns.add_exhibit(gems_and_minerals)
    dmns.add_exhibit(dead_sea_scrolls)
    dmns.add_exhibit(imax)
    assert_equal [gems_and_minerals, dead_sea_scrolls, imax], dmns.exhibits
  end
  def test_recomend
    dmns = Museum.new("Denver Museum of Nature and Science")
    gems_and_minerals = Exhibit.new("Gems and Minerals", 0)
    dead_sea_scrolls = Exhibit.new("Dead Sea Scrolls", 10)
    imax = Exhibit.new("IMAX", 15)
    dmns.add_exhibit(gems_and_minerals)
    dmns.add_exhibit(dead_sea_scrolls)
    dmns.add_exhibit(imax)
    bob = Patron.new("Bob", 20)
    bob.add_interest("Dead Sea Scrolls")
    bob.add_interest("Gems and Minerals")
    sally = Patron.new("Sally", 20)
    sally.add_interest("IMAX")
    assert_equal [gems_and_minerals, dead_sea_scrolls], dmns.recommend_exhibits(bob)
    assert_equal [imax], dmns.recommend_exhibits(sally)
  end
  def test_hash
    dmns = Museum.new("Denver Museum of Nature and Science")
    gems_and_minerals = Exhibit.new("Gems and Minerals", 0)
    dead_sea_scrolls = Exhibit.new("Dead Sea Scrolls", 10)
    imax = Exhibit.new("IMAX", 15)
    dmns.add_exhibit(gems_and_minerals)
    dmns.add_exhibit(dead_sea_scrolls)
    dmns.add_exhibit(imax)
    bob = Patron.new("Bob", 20)
    bob.add_interest("Dead Sea Scrolls")
    bob.add_interest("Gems and Minerals")
    sally = Patron.new("Sally", 20)
    sally.add_interest("Dead Sea Scrolls")
    dmns.admit(bob)
    dmns.admit(sally)
    assert_equal [bob, sally], dmns.patrons

    expected = {gems_and_minerals => [bob],
                dead_sea_scrolls => [bob, sally],
                imax => []}
    assert_equal expected, dmns.patrons_by_exhibit_interest
  end
end
