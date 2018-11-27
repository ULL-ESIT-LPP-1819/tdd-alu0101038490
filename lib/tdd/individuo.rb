# Clase para describir a una persona con datos básicos.
# 
# @author Jorge González Cabrera
#
# @!attribute [rw] nombre
#   @return [String] el nombre del individuo
# @!attribute [rw] apellidos
#   @return [String] los apellidos del individuo
# @!attribute [rw] sexo
#   @return [true,false] el sexo del individuo(true = hombre, false = mujer)
# @!attribute [rw] edad
#   @return [Fixnum] edad del individuo

class Individuo

	attr_accessor :nombre, :apellidos, :sexo, :edad

	# Crea un objeto individuo recibiendo los datos para todos los atributos de la clase.
	#
	# @return [Individuo]
	def initialize(nombre, apellidos, edad, sexo)
		@nombre = nombre
		@apellidos = apellidos
		@edad = edad
		@sexo = sexo
	end

	# Formatea los datos del individuo en una línea.
        #
        # @return [String] los datos del individuo.
	def to_s
		if @sexo
		    "\n  #{@nombre} #{@apellidos}, hombre, #{@edad} años"
		else
		    "\n  #{@nombre} #{@apellidos}, mujer, #{@edad} años"
		end
	end

end
