require_relative 'node'

class LinkedList
  def initialize(data) # constructor
    if data.class == Array
      @head = Node.new(data[0])
      data.each.with_index { |datum, index| self.add(datum) if index > 0}
    else
      @head = Node.new(data[0])
    end
    self
  end

  def head #returns head
    @head
  end

  def parse # parses all the members
    node = @head
    while (node != nil)
      puts node.get_data
      node = node.get_pointer
    end
  end

  def add(data)  # adds new members
    node = @head
    while (node.get_pointer != nil)
      node = node.get_pointer
    end
    node.set_pointer(Node.new(data, nil))
    self
  end

  def to_a # returns an array of all data
    node = @head
    array = Array.new
    while (node != nil)
      array << node.get_data
      node = node.get_pointer
    end
    array
  end

  def to_s # returns all data in form of string
    node = @head
    string = String.new
    while (node != nil)
      string << ", " << node.get_data.to_s
      node = node.get_pointer
    end
    string
  end

  def delete(data) # deletes a single member
    node = @head
    deleted_node = ''
    if node.get_data === data
      @head = node.get_pointer
      deleted_node = node
    else
      node = @head
      while( node != nil && node.get_pointer != nil && (node.get_pointer).get_data != data)
        node = node.get_pointer
      end
      if (node != nil) && (node.get_pointer != nil)
        node.set_pointer((node.get_pointer).get_pointer)
      end
      deleted_node = node.get_pointer
    end
    deleted_node = nil
  end
end
