require_relative "plane"

class Airport

  DEFAULT_CAPACITY = 3
  attr_reader :capacity, :parking_area

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @parking_area = []
  end

  def land(plane)
    fail "Airport is full" if full?
    plane.land(self)
    @parking_area << plane
  end

  def depart(plane)
    fail "No planes at airport" if empty?
    plane.depart
    @parking_area.pop
  end

  private

  def empty?
    @parking_area.empty?
  end

  def full?
    @parking_area.count >= capacity
  end

end
