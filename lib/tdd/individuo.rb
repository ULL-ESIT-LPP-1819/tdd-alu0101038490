class Individuo

	attr_accessor :nombre, :apellidos, :sexo, :edad

	def initialize(nombre, apellidos, edad, sexo)
		@nombre = nombre
		@apellidos = apellidos
		@edad = edad
		@sexo = sexo
	end

	def to_s
		if @sexo
		    "\n  #{@nombre} #{@apellidos}, hombre, #{@edad} años"
		else
		    "\n  #{@nombre} #{@apellidos}, mujer, #{@edad} años"
		end
	end

end
