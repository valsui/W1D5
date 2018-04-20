require 'byebug'

class PolyTreeNode

  attr_reader :parent, :children, :value
    def initialize(value)
      @parent = nil
      @children = []
      @value = value
    end

    def parent=(value)
      old_parent = self.parent
      if old_parent.nil?
        @parent = value
        value.children << self
      elsif old_parent == value
        puts "Parent has this node."
      else
        old_parent.children.delete(self)
        @parent = value
        value.children << self unless value.nil?
      end
    end

    def add_child(child_node)
      child_node.parent = self
    end

    def remove_child(child_node)
      child_node.parent = nil
    end

    def dfs(target_val)
      return nil if target_val.nil?
      return self if self.value == target_val

      self.children.each do |child|
        ans = child.dfs(target_val)
        return ans unless ans.nil?
      end

      nil
    end


    def bfs(target_val)
      queue = []

      queue << self
      return nil if target_val.nil?
      until queue.empty?
        first = queue.first
        return first if first.value == target_val
        queue = queue[1..-1] + first.children
        p "updated queue?!?! :< : #{queue.length}"
      end

      nil
    end

    # def inspect
    #   puts "---inspect method start------"
    #   puts "value: #{self.value}"
    #   puts "children: #{self.children.map {|polynodetree| polynodetree.value}}"
    #   puts "-----inspect method end ----"
    # end
end

# if __FILE__ == $PROGRAM_NAME
#
# node1 = PolyTreeNode.new('n1')
# node2 = PolyTreeNode.new('n2')
# node3 = PolyTreeNode.new('n3')
# node4 = PolyTreeNode.new('n4')
# node5 = PolyTreeNode.new('n5')
# node6 = PolyTreeNode.new('n6')
# node7 = PolyTreeNode.new('n7')
#  node4.parent = node2
#  node5.parent = node2
#  node2.parent = node1
#  node3.parent = node1
#  node6.parent = node3
#  node7.parent = node3
# p node1
#node1.bfs('n7')
# end
