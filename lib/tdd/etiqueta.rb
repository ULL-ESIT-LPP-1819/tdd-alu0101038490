class Etiqueta 

	attr_accessor :nombre, :grasas, :grasasSaturadas, :hidratosDeCarbono, 
		:azucares, :proteinas, :sal, :grasasMonoinsaturadas,
	       	:grasasPoliinsaturadas, :polialcoholes, :almidon, :fibraAlimentaria, 
		:vitaminas, :minerales

	attr_reader :porciones, :cantidadPorPorcion

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

		@porciones = 1
		@cantidadPorPorcion = 0.0
	end

	def dividirEnPorciones (porciones, cantidadPorPorcion)
		@porciones = porciones
		@cantidadPorPorcion = cantidadPorPorcion
	end

	def valorEnergeticoEnKJ
		valor = 0.0
		valor += (37 * @grasas)
		valor += (8 * @fibraAlimentaria)
		valor += (17 * @proteinas)
		valor += (25 * @sal)
		valor += (17 * @azucares)
		valor += (17 * @almidon)
		valor += (10 * @polialcoholes)
		if @porciones > 1
			[valor.round(0),(valor * (@cantidadPorPorcion / 100)).round(0)]
		else
			valor.round(0)
		end	
	end

	def valorEnergeticoEnKcal
		valor = valorEnergeticoEnKJ
		if valor.class == Array
			[(valor[0] / 4.184).round(0) , (valor[1] / 4.184).round(0)]
		else
			(valor / 4.184).round(0)
		end
	end

	def porcentajeValorEnergetico
		valor = valorEnergeticoEnKcal
		if valor.class == Array
			[((valor[0].to_f / 2000.0) * 100).round(0) , ((valor[1].to_f / 2000.0) * 100).round(0)]
		else
			((valor.to_f / 2000.0) * 100).round(0)
		end
	end

	def porcentajeGrasas
		if @porciones > 1
			gramosPorPorcion = @grasas * (@cantidadPorPorcion / 100)
			[((@grasas / 70) * 100).round(0),((gramosPorPorcion / 70) * 100).round(0)]
		else
			((@grasas / 70) * 100).round(0)
		end
	end

	def porcentajeSaturadas
		if @porciones > 1
			gramosPorPorcion = @grasasSaturadas * (@cantidadPorPorcion / 100)
			[((@grasasSaturadas / 20) * 100).round(0),((gramosPorPorcion / 20) * 100).round(0)]
		else
			((@grasasSaturadas / 20) * 100).round(0)
		end
	end

	def porcentajeHidratos 
		if @porciones > 1
			gramosPorPorcion = @hidratosDeCarbono * (@cantidadPorPorcion / 100)
			[((@hidratosDeCarbono / 260) * 100).round(0),((gramosPorPorcion / 260) * 100).round(0)]
		else
			((@hidratosDeCarbono / 260) * 100).round(0)
		end
	end

	def porcentajeAzucares
		if @porciones > 1
			gramosPorPorcion = @azucares * (@cantidadPorPorcion / 100)
			[((@azucares / 90) * 100).round(0),((gramosPorPorcion / 90) * 100).round(0)]
		else
			((@azucares / 90) * 100).round(0)
		end
	end

	def porcentajeProteinas
		if @porciones > 1
			gramosPorPorcion = @proteinas * (@cantidadPorPorcion / 100)
			[((@proteinas / 50) * 100).round(0),((gramosPorPorcion / 50) * 100).round(0)]
		else
			((@proteinas / 50) * 100).round(0)
		end
	end

	def porcentajeSal
		if @porciones > 1
			gramosPorPorcion = @sal * (@cantidadPorPorcion / 100)
			[((@sal / 6) * 100).round(0),((gramosPorPorcion / 6) * 100).round(0)]
		else
			((@sal / 6) * 100).round(0)
		end
	end
	
	def to_s
		"\tPor 100g\tIR (por 100g)\n" +
                "Valor energético:\t#{valorEnergeticoEnKJ}/#{valorEnergeticoEnKcal}\t#{porcentajeValorEnergetico}%\n" +
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
