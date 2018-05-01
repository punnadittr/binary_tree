class Node
  attr_accessor :parent, :left, :right

  def initialize(value = nil)
    @value = value
    @parent = nil
    @left = nil
    @right = nil
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
    node.left = build_tree(arr, first, mid_index-1 )
    node.right = build_tree(arr, mid_index+1, last)
    node
  end

  #for unsorted array
  def build_tree(arr)
    root ||= Node.new(arr[0])
    temp_node = Node.new(arr[0])
    new_node = Node.new(arr[1])
    if arr[1] >= temp_node.value
      if temp_node.right.nil?
      root.right = new_node
      else
        temp_node = temp_node.right
    else
      root.left = new_node
    end

  end
end

mytree = Tree.new
array = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324].sort
mytree.build_balanced_tree(array, 0, array.size-1)