module LinkedList

  class Node # this class defines one node the basic building blog of linked list
    attr_accessor :data, :pointer # data for holding data and pointers refers to next node

    def initialize(data, pointer = nil) #intializes when new is invoked
      @data = data
      @pointer = pointer
    end

    def to_s
      puts "Data: #{data} Points to: #{self.pointer.data}"
    end
  end

  class SinglyLinkedList
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
        puts node.data
        node = node.pointer
      end
    end

    def add(data)  # adds new members
      node = @head
      while (node.pointer != nil)
        node = node.pointer
      end
      node.pointer = Node.new(data)
      self
    end

    def to_a # returns an array of all data
      node = @head
      array = Array.new
      while (node != nil)
        array << node.data
        node = node.pointer
      end
      array
    end

    def to_s # returns all data in form of string
      node = @head
      string = String.new(@head.data.to_s)
      node = node.pointer
      while (node != nil)
        string << ", " << node.data.to_s
        node = node.pointer
      end
      string
    end

    def delete(data) # deletes a single member
      node = @head
      deleted_node = ''
      if node.data === data
        @head = node.pointer
        deleted_node = node
      else
        node = @head
        while( node != nil && node.pointer != nil && (node.pointer).data != data)
          node = node.pointer
        end
        if (node != nil) && (node.pointer != nil)
          node.pointer = (node.pointer).pointer
        end
        deleted_node = node.pointer
      end
      deleted_node = nil
    end
  end
end
