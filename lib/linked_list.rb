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

  class DoublyNode
    attr_accessor :data, :backward, :forward
    def initialize(data, backward=nil, forward=nil)
      @data = data
      @backward = backward
      @forward = forward
    end
  end

  class Singly
    def initialize(data) # constructor
      if data.class == Array
        @head = Node.new(data[0])
        data.each.with_index { |datum, index| self.add(datum) if index > 0}
      else
        @head = Node.new(data)
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

    def find(data)
      node = @head
      while (node != nil && node.data != data )
        node = node.pointer
      end
      node
    end

    def add(data)  # adds new members
      node = @head
      while (node.pointer != nil)
        node = node.pointer
      end
      node.pointer = Node.new(data)
      self
    end

    def add_a(data) # adds array members to the list
      node = @head
      while (node.pointer != nil)
        node = node.pointer
      end
      if data.respond_to? :each
        data.each { |datum| self.add(datum)}
      end
      self
    end

    def edit(old_data, new_data)
      node = find(old_data)
      if node
        node.data = new_data
      end
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

  class Doubly
    def initialize(data)
      if data.respond_to? :each
        @head = DoublyNode.new(data[0])
        data.each.with_index { |datum, index| self.add(datum) if index > 0}
      else
        @head = DoublyNode.new(data)
      end
      self
    end

    def add(data) # adds data to list
      dnode = @head
      while (dnode.forward != nil)
        dnode = dnode.forward
      end
      dnode.forward = DoublyNode.new(data, dnode)
      self
    end

    def head #returns head
      @head
    end

    def parse # parses all the members
      dnode = @head
      while (dnode != nil)
        puts dnode.data
        dnode = dnode.forward
      end
    end

    def to_a
      dnode = @head
      array = Array.new
      while (dnode != nil)
        array << dnode.data
        dnode = dnode.forward
      end
      array
    end

    def to_s
      dnode = @head
      string = String.new(@head.data.to_s)
      dnode = dnode.forward
      while (dnode != nil)
        string << ", " << dnode.data.to_s
        dnode = dnode.forward
      end
      string
    end

    def find(data)
      dnode = @head
      while (dnode != nil && dnode.data != data )
        dnode = dnode.forward
      end
      dnode
    end

    def delete(data)
      dnode = find(data)
      if dnode
        dnode1 = dnode.backward
        dnode2 = dnode.forward
        dnode1.forward = dnode2
        dnode2.backward = dnode1
      end
    end

  end
end
