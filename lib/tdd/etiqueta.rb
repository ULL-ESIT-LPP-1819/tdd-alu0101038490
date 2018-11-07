class Etiqueta 

	attr_accessor :nombre, :grasas, :grasasMonoinsaturadas, :grasasSaturadas, :hidratosDeCarbono, 
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
		@cantidadPorPorcion = 100.0
	end

	def dividirEnPorciones (porciones, cantidadPorPorcion)
		@porciones = porciones
		@cantidadPorPorcion = cantidadPorPorcion
	end

	def grasasPorPorcion 
		(@grasas * (@cantidadPorPorcion / 100)).round(2)
	end

	def grasasSaturadasPorPorcion 
		(@grasasSaturadas * (@cantidadPorPorcion / 100)).round(2)
	end
	
	def hidratosDeCarbonoPorPorcion 
		(@hidratosDeCarbono * (@cantidadPorPorcion / 100)).round(2)
	end

	def azucaresPorPorcion 
		(@azucares * (@cantidadPorPorcion / 100)).round(2)
	end

	def proteinasPorPorcion 
		(@proteinas * (@cantidadPorPorcion / 100)).round(2)
	end

	def salPorPorcion 
		(@sal * (@cantidadPorPorcion / 100)).round(2)
	end

	def grasasMonoinsaturadasPorPorcion 
		(@grasasMonoinsaturadas * (@cantidadPorPorcion / 100)).round(2)
	end

	def grasasPoliinsaturadasPorPorcion 
		(@grasasPoliinsaturadas * (@cantidadPorPorcion / 100)).round(2)
	end

	def polialcoholesPorPorcion 
		(@polialcoholes * (@cantidadPorPorcion / 100)).round(2)
	end

	def almidonPorPorcion 
		(@almidon * (@cantidadPorPorcion / 100)).round(2)
	end

	def fibraAlimentariaPorPorcion 
		(@fibraAlimentaria * (@cantidadPorPorcion / 100)).round(2)
	end

	def vitaminasPorPorcion 
		(@vitaminas * (@cantidadPorPorcion / 100)).round(2)
	end

	def mineralesPorPorcion 
		(@minerales * (@cantidadPorPorcion / 100)).round(2)
	end

	#Devuelve el valor energético respecto a los 100g y respecto a la cantidad por porción si las hay.
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

	#Devuelve el porcentaje sobre los 100g y también sobre la cantidad por porción si las hay (igual que los siguientes métodos).
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
		if @porciones <= 1
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
		else 
			"\tPor 100g\tIR (por 100g)\tPor #{@cantidadPorPorcion}g\tIR(por #{@cantidadPorPorcion}g)\n" +
                        "Valor energético:\t#{valorEnergeticoEnKJ[0]}/#{valorEnergeticoEnKcal[0]}\t#{porcentajeValorEnergetico[0]}%\t#{valorEnergeticoEnKJ[1]}/#{valorEnergeticoEnKcal[1]}\t#{porcentajeValorEnergetico[1]}%\n" +
                        "Grasas:\t#{@grasas}g\t#{porcentajeGrasas[0]}%\t#{grasasPorPorcion}g\t#{porcentajeGrasas[1]}%\n" +
                        "  Saturadas:\t#{@grasasSaturadas}g\t#{porcentajeSaturadas[0]}%\t#{grasasSaturadasPorPorcion}g\t#{porcentajeSaturadas[1]}%\n" +
                        "  Monoinsaturadas:\t#{@grasasMonoinsaturadas}g\t-\t#{grasasMonoinsaturadasPorPorcion}g\t-\n" +
                        "  Poliinsaturadas:\t#{@grasasPoliinsaturadas}g\t-\t#{grasasPoliinsaturadasPorPorcion}g\t-\n" +
                        "Hidratos:\t#{@hidratosDeCarbono}g\t#{porcentajeHidratos[0]}%\t#{hidratosDeCarbonoPorPorcion}\t#{porcentajeHidratos[1]}%\n" +
                        "  Azucares:\t#{@azucares}g\t#{porcentajeAzucares[0]}%\t#{azucaresPorPorcion}g\t#{porcentajeAzucares[1]}%\n" +
                        "  Polialcoholes:\t#{@polialcoholes}g\t-\t#{polialcoholesPorPorcion}g\t-\n" +
                        "  Almidón:\t#{@almidon}g\t-\t#{almidonPorPorcion}g\t-\n" +
                        "Fibra:\t#{@fibraAlimentaria}g\t-\t#{fibraAlimentariaPorPorcion}g\t-\n" +
                        "Proteinas:\t#{@proteinas}g\t#{porcentajeProteinas[0]}%\t#{proteinasPorPorcion}g\t#{porcentajeProteinas[1]}%\n" +
                        "Sal:\t#{@sal}g\t#{porcentajeSal[0]}%\t#{salPorPorcion}g\t#{porcentajeSal[1]}%\n" +
                        "Vitaminas:\t#{@vitaminas}g\t-\t#{@vitaminas}g\t-\n" +
                        "Minerales:\t#{@minerales}g\t-\t#{@minerales}g\t-\n"
		end
	end

end
