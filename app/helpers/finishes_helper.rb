module FinishesHelper
  def setup_finishes(race)
    race.tap do |r|
      if race.finishes.empty?
        6.times { race.finishes.build }
      end
    end
  end
end