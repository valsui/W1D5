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
    
end