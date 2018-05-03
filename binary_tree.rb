class Node
  attr_accessor :left, :right

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
  attr_accessor :root

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

  def insert(value, node = @root)
    new_node = Node.new(value)
    if node.nil?
      @root = new_node
    else
      if value < node.value
        if node.left.nil?
          node.left = new_node
        else
          node = node.left
          insert(value, node)
        end
      else
        if node.right.nil?
          node.right = new_node
        else
          node = node.right
          insert(value, node)
        end
      end
    end
  end

  #for unsorted array
  def build_tree(array)
    array.each do |num|
      insert num
    end
  end

  def dfs(val, node = @root)
    stack = []
    loop do
      if node != nil
        stack << node
        node = node.left
      else
        return if stack.empty?
        node = stack.pop
        return node if node.value == val
        node = node.right
      end
    end
  end

  def dfs_rec(val = nil, node = @root)
    return if node.nil?
    print node if node.value == val
    dfs_rec(val, node.left)
    dfs_rec(val, node.right)
    end
  end

  def bfs(val)
    stack = []
    stack << @root
    while stack.empty? != true
      current = stack[0]
      return current if current.value == val
      stack << current.left if current.left.nil? != true
      stack << current.right if current.right.nil? != true
      stack.shift
    end
    nil
  end
end

mytree = Tree.new
array = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324].shuffle!
mytree.build_tree(array)