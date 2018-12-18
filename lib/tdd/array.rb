
class Array 

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
