class Node # this class defines one node the basic building blog of linked list
  attr_accessor :data, :pointer # data for holding data and pointers refers to next node

  def initialize(data, pointer = nil) #intializes when new is invoked
    @data = data
    @pointer = pointer
  end

  def get_pointer # returns next node
    @pointer
  end

  def set_pointer(pointer) #sets next node
    @pointer = pointer
  end

  def set_data data # sets data
    @data = data
  end

  def get_data # returns data
    @data
  end
end
