require "byebug"

class PolyTreeNode
  attr_accessor :value, :parent, :children
  def initialize(value = 0)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(new_parent)
    
      if @parent !=nil
        parent.children = parent.children.reject!{ |child| child == self}
      end
      @parent =  new_parent
      if parent != nil && !new_parent.children.include?(self)
        parent.children << self
      end
      
  end

  def add_child(child)
    child.parent= self
  end

  def remove_child(child)
    raise 'error' if !child.parent.children.include?(child)
    child.parent= nil
  end


  def dfs(val)
    # return self if value == val
    # children.each do |child|
    #   return child.dfs(val) if !child.dfs(val).nil?
    # end
    # nil

    return self if value == val

    children.each do |child|
      result = child.dfs(val)
      return result if !result.nil?
    end
    nil
  end

  def bfs(val)
    queue = [self]   #put node into stack
    while !queue.empty?
      temp = queue.shift
      return temp if temp.value == val
      queue += temp.children
    end
    return nil
  end

end
