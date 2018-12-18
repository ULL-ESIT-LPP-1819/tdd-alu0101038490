# Contenedor que sigue la filosofía de lista doblemente enlazada.
# 
# @author Jorge González Cabrera
#
# @!attribute [r] tail
#   @return [Node] último elemento de la lista
# @!attribute [r] head
#   @return [Node] primer elemento de la lista
# @!attribute [r] size
#   @return [Fixnum] cantidad de elementos en la lista

class List

	include Enumerable

	Node = Struct.new(:value, :next, :prev)

	attr_reader :tail, :head, :size

	# Crea una lista vacía.
	#
	# @return [List]
	def initialize
		@tail = nil
		@head = nil
		@size = 0
	end

	# Inserta un valor al final de la lista.
	#
	# @param valor valor o nodo que se introduce en la lista.
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

	# Inserta un valor al principio de la lista.
	#
	# @param valor valor o nodo que se introduce en la lista.
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

	# Elimina un elemento del final de la lista.
	def pop_back
		@tail = @tail.prev unless @tail == nil
		@tail.next = nil unless @tail == nil
		@head = nil if @tail == nil
		if @size > 0
			@size = @size - 1
		end
		return nil
	end

	# Elimina un elemento del principio de la lista.
	def pop_front
		@head = @head.next unless @head == nil
		@head.prev = nil unless @head == nil
		@tail = nil if @head == nil
		if @size > 0
			@size = @size - 1
		end
		return nil
	end

	# Inserta un elemento en una posición concreta de la lista.
	#
	# @param position [Fixnum] posición en la que se quiere insertar el elemento.
	# @param valor valor o nodo que se quiere incluir.
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

	# Elimina un elemento en una posición concreta de la lista.
	#
	# @param position [Fixnum] posición del elemento que se quiere eliminar.
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

	# Permite saber si la lista está vacía.
	#
	# @return [true,false] devuelve 'true' si la lista está vacía y false en caso contrario.
	def isEmpty
		return size == 0
	end

	# Método necesario para que se pueda 'enumerar' la clase, requerido por el módulo Enumerable.
	def each
		iterator = head
		while iterator != nil do
			yield iterator.value
			iterator = iterator.next
		end
	end

	def sort_for(&block)
                arrayOrdenado = []
                for i in self
                        j = 0
                        while j < arrayOrdenado.length && block.call(i,arrayOrdenado[j]) == 1
                                j += 1
                        end
                        arrayOrdenado.insert(j,i)
                end
                arrayOrdenado
        end

        def sort_each(&block)
                arrayOrdenado = []
                each do |i|
                        j = 0
                        while j < arrayOrdenado.length && block.call(i,arrayOrdenado[j]) == 1
                                j += 1
                        end
                        arrayOrdenado.insert(j,i)
                end
                arrayOrdenado
        end

end
