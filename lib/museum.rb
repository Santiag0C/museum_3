require 'pry'
class Museum
  attr_reader :name, :exhibits, :patrons
  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibits(name_obj)
    recomended = []
    name_obj.interests.each do |interest|
      @exhibits.each do |exhibit|
      if interest == exhibit.name
        recomended << exhibit
        end
      end
    end
    recomended.reverse
  end

  def admit(name_obj)
    @patrons << name_obj
  end

  def patrons_by_exhibit_interest
    # @exhibits.each do |x|

    end
  end
