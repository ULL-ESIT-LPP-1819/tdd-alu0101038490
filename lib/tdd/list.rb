class List

	Node = Struct.new(:value, :next, :prev)

	attr_accessor :tail, :head, :size

	def initialize
		@size = 0
	end

	def push_back(valor)
		if valor.class == Node
			valor.next = nil
			valor.prev = @tail
			@tail.next = valor unless @tail.nil?
			@tail = valor
			@head = valor if @head.nil?
		else
			addedNode = Node.new(valor)
			addedNode.prev = @tail
			@tail.next = addedNode unless @tail.nil?
			@tail = addedNode
			@head = addedNode if @head.nil?
		end	
		@size = @size + 1
	end

	def push_front(valor)
		if valor.class == Node
			valor.prev = nil
			valor.next = @head
			@head.prev = valor unless @head.nil?
			@head = valor
			@tail = valor if @tail.nil?
		else
			addedNode = Node.new(valor)
			addedNode.next = @head
			@head.prev = addedNode unless @head.nil?
			@head = addedNode
			@tail = addedNode if @tail.nil?
		end	
		@size = @size + 1
	end

	def pop_back
		@tail = @tail.prev unless @tail == nil
		@tail.next = nil unless @tail == nil
		@head = nil if @tail == nil
		if @size > 0
			@size = @size - 1
		end
	end

	def pop_front
		@head = @head.next unless @head == nil
		@head.prev = nil unless @head == nil
		@tail = nil if @head == nil
		if @size > 0
			@size = @size - 1
		end
	end

	def insert (position, valor)
		if position.is_a? Integer
			if position == 0 
				push_front(valor)
			elsif position == @size
				push_back(valor)
			elsif position < @size && position > 0
				if valor.class == Node
					iterator = @head
					position.times do |i|
						iterator = iterator.next
					end		
					valor.prev = iterator.prev
					valor.next = iterator
					iterator.prev = valor
					valor.prev.next = valor
				else
					addedNode = Node.new(valor)
					iterator = @head
					position.times do |i|
						iterator = iterator.next
					end		
					addedNode.prev = iterator.prev
					addedNode.next = iterator
					iterator.prev = addedNode
					addedNode.prev.next = addedNode
				end
				@size = @size + 1
			end
		end
	end

end
