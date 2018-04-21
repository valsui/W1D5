require 'byebug'

class KnightPathFinder

  def initialize(pos)
    @init_pos = pos
    @visited_moves = [pos]
  end

  def self.valid_moves(pos)
    ans = []
    numbers = (-2..2).to_a - [0]
    numbers.each do |i|
      numbers.each do |j|
        if i.abs + j.abs == 3
          current = [pos[0] + i, pos[1] + j]
          ans << current if current.all? {|x| x.between?(0,7)}
        end
      end
    end
    ans
  end

  def new_move_positions(pos)
    valid_positions = self.class.valid_moves(pos)
    p "current visited moves: #{@visited_moves}"
    valid_positions -= @visited_moves
    p "valid positions after removing visited: #{valid_positions}"
    @visited_moves += valid_positions
    p "valid positions for #{pos} are : #{valid_positions}"
    p " -----------------------"
    valid_positions
  end

  def build_move_tree
    tree = [@init_pos]
    # debugger
    valid_positions = new_move_positions(@init_pos)
    valid_positions.each do |move|
      memo = new_move_positions(move)
      p "move: #{move}"
      p "adding to valid positions: #{ memo}"
      p "--------------------"
      valid_positions += memo
      break if memo.empty?

    end
    valid_positions
  end

end
