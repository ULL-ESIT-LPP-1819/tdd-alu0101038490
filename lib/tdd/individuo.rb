class Individuo

	attr_accessor :nombre, :apellidos, :sexo, :edad

	def initialize(nombre, apellidos, edad, sexo)
		@nombre = nombre
		@apellidos = apellidos
		@edad = edad
		@sexo = sexo
	end

end
