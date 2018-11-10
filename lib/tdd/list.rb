class List

	Node = Struct.new(:value, :next, :prev)

	attr_accessor :tail, :head

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
	end

	def pop_back
		@tail = @tail.prev unless @tail == nil
		@tail.next = nil unless @tail == nil
		@head = nil if @tail == nil
	end

	def pop_front
		@head = @head.next unless @head == nil
		@head.prev = nil unless @head == nil
		@tail = nil if @head == nil
	end

end
