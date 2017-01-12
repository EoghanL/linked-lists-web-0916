class Node

  attr_accessor :data, :next

  def initialize(data, next_item = nil)
    @data = data
    @next = next_item
  end

end

class LinkedList

  def initialize(data = nil)
    @head = Node.new(data)
  end

  def head
    @head
  end

  def get_node(index)
    node = @head
    index.times do
      node.next ? node = node.next : node = nil
    end
    node
  end

  def index_at(index)
    get_node(index) ? get_node(index).data : nil
  end

  def insert_at_index(index, data)
    node = @head
    new_node = Node.new(data)
    counter = 0
    while counter < index
      node.next = Node.new(nil) if node.next == nil
      if counter == index - 1
        new_node.next = get_node(index)
        node.next = new_node
      end
      node = node.next
      counter += 1
    end
  end

  def unshift(data)
    new_head = Node.new(data)
    new_head.next = @head
    @head = new_head
  end

  def push(data)
    current_node = @head
    while current_node.next.data != nil
      current_node = current_node.next
    end
    current_node.next = Node.new(data)
  end

end

# new_node = Node.new(data)
# replace_next = self.get_node(index - 1)
# new_node.next = self.get_node(index)
# debugger
# replace_next.next = new_node if replace_next
