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
end