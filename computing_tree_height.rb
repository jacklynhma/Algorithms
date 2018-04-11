class Node
  attr_accessor :children, :parent

  def initialize
    @children = []
  end
end

def test(expected_answer, result)
  if expected_answer == result
    puts "Correct!"
  else
    puts "Result: #{result}, Answer: #{expected_answer}"
  end
end

def calculate_tree_height(queue, height, count)
  while !queue.empty?
    layer_count = queue.length
    count = 0
    while count < layer_count
      current_node = queue.pop
      # print current_id
      current_node.children.each do |child|
        queue.push(child)
      end
      count += 1
    end
    height += 1
  end
  return height
end

def build_node_map(array, node_map, root)
  array.each_with_index do |parent_id, id|
    if node_map[id].nil?
      node = Node.new()
    else
      node = node_map[id]
    end
    # if it is not the root
    if parent_id != -1
      if node_map[parent_id].nil?
        node_map[parent_id] = Node.new
      end
      node.parent = node_map[parent_id]
      node_map[parent_id].children.push(node)
    else
      root = node
    end

    node_map[id] = node
  end
  return root
end

def tree_height(array)
  node_map = {  }
  root = nil

  root = build_node_map(array, node_map, root)
  max_index = array.length

  queue = Queue.new
  count = 0
  height = 0
  # establishes queue
  queue.push(root)

  # while the generations exist, count loop
  calculate_tree_height(queue, height, count)
end

array = [3, 3, 4, -1, 5]
result = tree_height(array)
expected_answer = 2

print test(expected_answer, result)
