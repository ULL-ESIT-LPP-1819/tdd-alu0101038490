class List

	Node = Struct.new(:value, :next, :prev)

	attr_accessor :tail, :head

	def push(valor)
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

end
