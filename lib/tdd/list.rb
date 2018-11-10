class List

	Node = Struct.new(:value, :next, :prev)

	attr_accessor :tail, :head

end
