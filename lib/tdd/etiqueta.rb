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
	
	def to_s
		"\tPor 100g\tIR (por 100g)\n" +
                "Valor energético:\t#{valorEnergeticoEnKJ}/#{valorEnergeticoEnKcal}\t??%\n" +
                "Grasas:\t#{@grasas}g\t#{porcentajeGrasas}%\n" +
                "  Saturadas:\t#{@grasasSaturadas}g\t#{porcentajeSaturadas}%\n" +
                "  Monoinsaturadas:\t#{@grasasMonoinsaturadas}g\t-\n" +
                "  Poliinsaturadas:\t#{@grasasPoliinsaturadas}g\t-\n" +
                "Hidratos:\t#{@hidratosDeCarbono}g\t#{porcentajeHidratos}%\n" +
                "  Azucares:\t#{@azucares}g\t#{porcentajeAzucares}%\n" +
                "  Polialcoholes:\t#{@polialcoholes}g\t-\n" +
                "  Almidón:\t#{@almidon}g\t-\n" +
                "Fibra:\t#{@fibraAlimentaria}g\t-\n" +
                "Proteinas:\t#{@proteinas}g\t#{porcentajeProteinas}%\n" +
                "Sal:\t#{@sal}g\t#{porcentajeSal}%\n" +
                "Vitaminas:\t#{@vitaminas}g\t-\n" +
                "Minerales:\t#{@minerales}g\t-\n"
	end

end
