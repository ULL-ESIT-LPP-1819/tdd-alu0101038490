class Etiqueta 

	attr_accessor :nombre, :grasas, :grasasSaturadas, :hidratosDeCarbono, 
		:azucares, :proteinas, :sal, :grasasMonoinsaturadas,
	       	:grasasPoliinsaturadas, :polialcoholes, :almidon, :fibraAlimentaria, 
		:vitaminas, :minerales

	def initialize(nombre, grasas, grasasSaturadas, hidratosDeCarbono, 
                azucares, proteinas, sal, grasasMonoinsaturadas, 
                grasasPoliinsaturadas, polialcoholes, almidon, fibraAlimentaria, 
                vitaminas, minerales)

		@nombre  = nombre
		@grasas = grasas
		@grasasSaturadas = grasasSaturadas
		@hidratosDeCarbono = hidratosDeCarbono
		@azucares = azucares
		@proteinas = proteinas
		@sal = sal
		@grasasMonoinsaturadas = grasasMonoinsaturadas
		@grasasPoliinsaturadas = grasasPoliinsaturadas
		@polialcoholes = polialcoholes
		@almidon = almidon
		@fibraAlimentaria = fibraAlimentaria
		@vitaminas = vitaminas
		@minerales = minerales
	end

end
