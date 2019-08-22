require './lib/ship'
require './lib/cell'
require './lib/board'

class Board
  def initialize()
    @cells = {
      "A1" => Cell.new("A1"),
      "A2" => Cell.new("A2"),
      "A3" => Cell.new("A3"),
      "A4" => Cell.new("A4"),
      "B1" => Cell.new("B1"),
      "B2" => Cell.new("B2"),
      "B3" => Cell.new("B3"),
      "B4" => Cell.new("B4"),
      "C1" => Cell.new("C1"),
      "C2" => Cell.new("C2"),
      "C3" => Cell.new("C3"),
      "C4" => Cell.new("C4"),
      "D1" => Cell.new("D1"),
      "D2" => Cell.new("D2"),
      "D3" => Cell.new("D3"),
      "D4" => Cell.new("D4"),
      }
  end

  def valid_coordinate?(cell)
    @cells.keys.include?(cell)
  end

  def valid_placement?(ship, array)
    ship_is_placed_in_a_straight_line?(ship, array) && ship_isnt_placed_on_another_ship?(array)
  end

  def ship_is_placed_in_a_straight_line?(ship, array)
    letters = array.map {|element| element[0]}
    numbers = array.map {|element| element[1]}
    yrange = Range.new(letters.first,letters.last).count
    # Passed in array is horizontally consecutive and all letters are the same (placed on same row)
    if @cells.keys.each_cons(ship.length).any? {|a| a == array} && letters.uniq.count == 1
      true
    # Passed in array is vertically consecutive and all numbers are the same (placed in same column)
    elsif (letters.uniq.count == array.count) && (numbers.uniq.count == 1) && (yrange == ship.length)
      true
    else
      false
    end
  end

  def ship_isnt_placed_on_another_ship?(array)
    # make sure cell.ship is nil for all cells in placement array
    array.all? do |element|
      @cells[element].ship == nil
    end
  end
end
