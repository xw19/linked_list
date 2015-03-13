# Linked List
[![Gem Version](https://badge.fury.io/rb/linked_list_sourav.svg)](http://badge.fury.io/rb/linked_list_sourav)
This is linked list implementation both singly and doubly in ruby. Its main purpose is demonstration.

## Usage

```ruby
  require "linked_list_sourav"
  list = LinkedList::Singly.new(1) # intializes a new list
  list.head # returns head node
  list.add(2) # adds a new node
  3.upto(20) { |data| list.add(data)}
  list.find(10) # finds and return the node that contains data as 10
  list.delete(6)  # removes the node that contain 6 as data
  list.add_a([21, 22, 23, 24]) #adds array members directly
  list = LinkedList::Singly.new([1, 2, 3, 4]) # intialize with an array
  list.parse # prints all the data from the list
  list.to_a # prints an array of all data
  list.to_s #prints an string of all data
  list.no_of_nodes # returns no of nodes present in the linked list

  ### The same for Doubly Linked list ###

  list = LinkedList::Doubly.new(1) # intializes a new list
  list.head # returns head node
  list.add(2) # adds a new node
  3.upto(20) { |data| list.add(data)}
  list.find(10) # finds and return the node that contains data as 10
  list.delete(6)  # removes the node that contain 6 as data
  list = LinkedList::Doubly.new([1, 2, 3, 4]) # intialize with an array
  list.parse # prints all the data from the list
  list.to_a # prints an array of all data
  list.to_s #prints an string of all data
```
