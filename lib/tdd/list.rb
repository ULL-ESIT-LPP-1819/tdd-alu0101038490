class List

	include Enumerable

	Node = Struct.new(:value, :next, :prev)

	attr_reader :tail, :head, :size

	def initialize
		@tail = nil
		@head = nil
		@size = 0
	end

	def push_back(valor)
		if valor.class == Node
			addedNode = valor
		else
			addedNode = Node.new(valor)
		end
		addedNode.next = nil
		addedNode.prev = @tail
		@tail.next = addedNode unless @tail.nil?
		@tail = addedNode
		@head = addedNode if @head.nil?	
		@size = @size + 1
		return nil
	end

	def push_front(valor)
		if valor.class == Node
			addedNode = valor
		else
			addedNode = Node.new(valor)
		end
		addedNode.prev = nil
		addedNode.next = @head
		@head.prev = addedNode unless @head.nil?
		@head = addedNode
		@tail = addedNode if @tail.nil?	
		@size = @size + 1
		return nil
	end

	def pop_back
		@tail = @tail.prev unless @tail == nil
		@tail.next = nil unless @tail == nil
		@head = nil if @tail == nil
		if @size > 0
			@size = @size - 1
		end
		return nil
	end

	def pop_front
		@head = @head.next unless @head == nil
		@head.prev = nil unless @head == nil
		@tail = nil if @head == nil
		if @size > 0
			@size = @size - 1
		end
		return nil
	end

	def insert (position, valor)
		if position.is_a? Integer
			if position == 0 
				push_front(valor)
			elsif position == @size
				push_back(valor)
			elsif position < @size && position > 0
				if valor.class == Node
					addedNode = valor
				else
					addedNode = Node.new(valor)
				end
				iterator = @head
				position.times do |i|
					iterator = iterator.next
				end		
				addedNode.prev = iterator.prev
				addedNode.next = iterator
				iterator.prev = addedNode
				addedNode.prev.next = addedNode
				@size = @size + 1
			end
		end
		return nil
	end

	def remove (position)
		if position.is_a? Integer
			if position == 0 
				pop_front
			elsif position == (@size - 1)
				pop_back
			elsif position < (@size - 1) && position > 0
				iterator = @head
				position.times do |i|
					iterator = iterator.next
				end		
				iterator.next.prev = iterator.prev
				iterator.prev.next = iterator.next
				@size = @size - 1
			end
		end
		return nil
	end

	def isEmpty
		return size == 0
	end

	def each
		iterator = head
		while iterator != nil do
			yield iterator.value
			iterator = iterator.next
		end
	end

end
