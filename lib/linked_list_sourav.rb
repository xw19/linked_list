class LinkedList

  class Node # this class defines one node the basic building blog of linked list
    attr_accessor :data, :forward # data for holding data and forwards refers to next node

    def initialize(data, forward = nil) #intializes when new is invoked
      @data = data
      @forward = forward
      self
    end

    def to_s
      string = "Data: #{self.data} "
      string << "Points to: #{self.forward.data}" if self.forward
      string
    end
  end

  class DoublyNode
    attr_accessor :data, :backward, :forward
    def initialize(data, backward=nil, forward=nil)
      @data = data
      @backward = backward
      @forward = forward
      self
    end

    def to_s
      string = "Data: #{self.data} "
      string << "Points to: #{self.forward.data}" if self.forward
      string << " Pointed by: #{self.backward.data}" if self.backward
      string
    end
  end

  class Singly
    def initialize(data = nil) # constructor
      @count = 1
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
        node = node.forward
      end
    end

    def find(data)
      node = @head
      while (node != nil && node.data != data )
        node = node.forward
      end
      node
    end

    def no_of_nodes
      @count
    end

    def add(data)  # adds new members
      node = @head
      while (node.forward != nil)
        node = node.forward
      end
      node.forward = Node.new(data)
      @count += 1
      node.forward
    end

    def add_a(data) # adds array members to the list
      node = @head
      while (node.forward != nil)
        node = node.forward
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
        node = node.forward
      end
      array
    end

    def to_s # returns all data in form of string
      node = @head
      string = String.new(@head.data.to_s)
      node = node.forward
      while (node != nil)
        string << ", " << node.data.to_s
        node = node.forward
      end
      string
    end

    def delete(data) # deletes a single member
      node = @head
      deleted_node = ''
      if node.data === data
        @head = node.forward
        deleted_node = node
        @count -= 1
      else
        node = @head
        while( node != nil && node.forward != nil && (node.forward).data != data)
          node = node.forward
        end
        if (node != nil) && (node.forward != nil)
          node.forward = (node.forward).forward
          @count -= 1
        end
        deleted_node = node.forward
      end
      deleted_node = nil
    end
  end

  class Doubly < Singly
    def initialize(data) # intializes
      @count = 1
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
      @count += 1
      self
    end

    def delete(data) # deletes a node
      dnode = find(data)
      if dnode
        if dnode === @head
          @head = dnode.forward
        elsif dnode.forward == nil
          prev_dnode = dnode.backward
          prev_dnode.forward = nil
        else
          prev_dnode, next_dnode = dnode.backward, dnode.forward
          prev_dnode.forward, next_dnode.backward = next_dnode, prev_dnode
        end
        @count -= 1
      end
      dnode = nil
    end
  end
end
