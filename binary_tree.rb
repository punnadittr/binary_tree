class Node
  attr_accessor :parent, :left, :right

  def initialize(value = nil)
    @value = value
    @left = nil
    @right = nil
  end

  def value
    @value
  end
end

class Tree
  def initialize
    @root = nil
  end

  #for sorted array
  def build_balanced_tree(arr, first, last)
    return if first > last
    mid_index = (first + last) / 2
    node = Node.new arr[mid_index]
    @root ||= node
    node.left = build_balanced_tree(arr, first, mid_index-1 )
    node.right = build_balanced_tree(arr, mid_index+1, last)
    node
  end

  def insert(value)
    new_node = Node.new(value)
    if @root.nil?
      @root = new_node
      return @temp_node = @root
    else
      if value < @temp_node.value
        if @temp_node.left.nil?
          @temp_node.left = new_node
        else
          @temp_node = @temp_node.left
          insert(value)
        end
      else
        if @temp_node.right.nil?
          @temp_node.right = new_node
        else
          @temp_node = @temp_node.right
          insert(value)
        end
      end
    end
  end

  #for unsorted array
  def build_tree(array)
    array.each do |num|
      insert num
    end
    @temp_node = nil
  end

  def bfs(val)
    array = []
    array << @root
    while array.empty? != true
      current = array[0]
      return current if current.value == val
      array << current.left if current.left.nil? != true
      array << current.right if current.right.nil? != true
      array.shift
    end
    nil
  end
end

mytree = Tree.new
mytree.build_tree((1..5).to_a.shuffle!)