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

	def valorEnergeticoEnKJ
		valor = 0.0
		valor += (27 * @grasas)
		valor += (8 * @fibraAlimentaria)
		valor += (17 * @proteinas)
		valor += (25 * @sal)
		valor.round(0)
	end

	def valorEnergeticoEnKcal
		valorEnergeticoEnKJ / 4.184
	end

	def porcentajeValorEnergetico

	end

	def porcentajeGrasas
		((@grasas / 70) * 100).round(0)
	end

	def porcentajeSaturadas
		((@grasasSaturadas / 20) * 100).round(0)
	end

	def porcentajeHidratos 
		((@hidratosDeCarbono / 260) * 100).round(0)
	end

	def porcentajeAzucares
		((@azucares / 90) * 100).round(0)
	end

	def porcentajeProteinas
		((@proteinas / 50) * 100).round(0)
	end

	def porcentajeSal
		((@sal / 6) * 100).round(0)
	end

end
