# Clase para describir el valor nutricional de un alimento.
# 
# @author Jorge González Cabrera
#
# @!attribute [rw] nombre
#   @return [String] el nombre del alimento
# @!attribute [rw] grasas
#   @return [Float] la cantidad de grasa en 100 gramos de alimento
# @!attribute [rw] grasasMonoinsaturadas
#   @return [Float] la cantidad de grasas monoinsaturadas en 100 gramos de alimento
# @!attribute [rw] grasasPoliinsaturadas
#   @return [Float] la cantidad de grasas poliinsaturadas en 100 gramos de alimento
# @!attribute [rw] grasasSaturadas
#   @return [Float] la cantidad de grasas saturadas en 100 gramos de alimento
# @!attribute [rw] hidratosDeCarbono
#   @return [Float] la cantidad de hidratos de carbono en 100 gramos de alimento
# @!attribute [rw] azucares
#   @return [Float] la cantidad de azucares en 100 gramos de alimento
# @!attribute [rw] proteinas
#   @return [Float] la cantidad de proteinas en 100 gramos de alimento
# @!attribute [rw] sal
#   @return [Float] la cantidad de sal en 100 gramos de alimento
# @!attribute [rw] polialcoholes
#   @return [Float] la cantidad de polialcoholes en 100 gramos de alimento
# @!attribute [rw] almidon
#   @return [Float] la cantidad de almidon en 100 gramos de alimento
# @!attribute [rw] fibraAlimentaria
#   @return [Float] la cantidad de fibra alimentaria en 100 gramos de alimento
# @!attribute [rw] vitaminas
#   @return [Float] la cantidad de vitaminas en 100 gramos de alimento
# @!attribute [rw] minerales
#   @return [Float] la cantidad de minerales en 100 gramos de alimento
# @!attribute [r] porciones
#   @return [Fixnum] la cantidad de porciones en las que se divide el alimento
# @!attribute [r] cantidadPorPorcion
#   @return [Float] gramos que contiene cada porción

class Etiqueta 

	include Comparable

	attr_accessor :nombre, :grasas, :grasasMonoinsaturadas, :grasasSaturadas, :hidratosDeCarbono, 
		:azucares, :proteinas, :sal, :grasasMonoinsaturadas,
	       	:grasasPoliinsaturadas, :polialcoholes, :almidon, :fibraAlimentaria, 
		:vitaminas, :minerales

	attr_reader :porciones, :cantidadPorPorcion

	# Crea una etiqueta sin porciones con todos los datos dados en gramos / 100 gramos de alimento.
	#
	# @return [Etiqueta]
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

	# Divide el alimento en porciones.
	#
	# @param porciones [Fixnum] la cantidad de porciones en la que se divide.
	# @param cantidadPorPorcion [Float] gramos de cada porción.
	# @return [nil]
	def dividirEnPorciones (porciones, cantidadPorPorcion)
		@porciones = porciones
		@cantidadPorPorcion = cantidadPorPorcion
		nil
	end

	# Calcula la cantidad de grasas que contiene cada porción si esta dividido en porciones.
	#
	# @return [Float] cantidad de grasas por porción, o por 100 gramos de alimento si no está divido en porciones.
	def grasasPorPorcion 
		(@grasas * (@cantidadPorPorcion / 100)).round(2)
	end

	# Calcula la cantidad de grasas saturadas que contiene cada porción si esta dividido en porciones.
	#
	# @return [Float] cantidad de grasas saturadas por porción, o por 100 gramos de alimento si no está divido en porciones.
	def grasasSaturadasPorPorcion 
		(@grasasSaturadas * (@cantidadPorPorcion / 100)).round(2)
	end
	
	# Calcula la cantidad de hidratos de carbono que contiene cada porción si esta dividido en porciones.
	#
	# @return [Float] cantidad de hidratos de carbono por porción, o por 100 gramos de alimento si no está divido en porciones.
	def hidratosDeCarbonoPorPorcion 
		(@hidratosDeCarbono * (@cantidadPorPorcion / 100)).round(2)
	end

	# Calcula la cantidad de azucares que contiene cada porción si esta dividido en porciones.
	#
	# @return [Float] cantidad de azucares por porción, o por 100 gramos de alimento si no está divido en porciones.
	def azucaresPorPorcion 
		(@azucares * (@cantidadPorPorcion / 100)).round(2)
	end

	# Calcula la cantidad de proteinas que contiene cada porción si esta dividido en porciones.
	#
	# @return [Float] cantidad de proteinas por porción, o por 100 gramos de alimento si no está divido en porciones.
	def proteinasPorPorcion 
		(@proteinas * (@cantidadPorPorcion / 100)).round(2)
	end

	# Calcula la cantidad de sal que contiene cada porción si esta dividido en porciones.
	#
	# @return [Float] cantidad de sal por porción, o por 100 gramos de alimento si no está divido en porciones.
	def salPorPorcion 
		(@sal * (@cantidadPorPorcion / 100)).round(2)
	end

	# Calcula la cantidad de grasas monoinsaturadas que contiene cada porción si esta dividido en porciones.
	#
	# @return [Float] cantidad de grasas monoinsaturadas por porción, o por 100 gramos de alimento si no está divido en porciones.
	def grasasMonoinsaturadasPorPorcion 
		(@grasasMonoinsaturadas * (@cantidadPorPorcion / 100)).round(2)
	end

	# Calcula la cantidad de grasas poliinsaturadas que contiene cada porción si esta dividido en porciones.
	#
	# @return [Float] cantidad de grasas poliinsaturadas por porción, o por 100 gramos de alimento si no está divido en porciones.
	def grasasPoliinsaturadasPorPorcion 
		(@grasasPoliinsaturadas * (@cantidadPorPorcion / 100)).round(2)
	end

	# Calcula la cantidad de polialcoholes que contiene cada porción si esta dividido en porciones.
	#
	# @return [Float] cantidad de polialcoholes por porción, o por 100 gramos de alimento si no está divido en porciones.
	def polialcoholesPorPorcion 
		(@polialcoholes * (@cantidadPorPorcion / 100)).round(2)
	end

	# Calcula la cantidad de almidón que contiene cada porción si esta dividido en porciones.
	#
	# @return [Float] cantidad de almidón por porción, o por 100 gramos de alimento si no está divido en porciones.
	def almidonPorPorcion 
		(@almidon * (@cantidadPorPorcion / 100)).round(2)
	end

	# Calcula la cantidad de fibra alimentaria que contiene cada porción si esta dividido en porciones.
	#
	# @return [Float] cantidad de fibra alimentaria por porción, o por 100 gramos de alimento si no está divido en porciones.
	def fibraAlimentariaPorPorcion 
		(@fibraAlimentaria * (@cantidadPorPorcion / 100)).round(2)
	end

	# Calcula la cantidad de vitaminas que contiene cada porción si esta dividido en porciones.
	#
	# @return [Float] cantidad de vitaminas por porción, o por 100 gramos de alimento si no está divido en porciones.
	def vitaminasPorPorcion 
		(@vitaminas * (@cantidadPorPorcion / 100)).round(2)
	end

	# Calcula la cantidad de minerales que contiene cada porción si esta dividido en porciones.
	#
	# @return [Float] cantidad de minerales por porción, o por 100 gramos de alimento si no está divido en porciones.
	def mineralesPorPorcion 
		(@minerales * (@cantidadPorPorcion / 100)).round(2)
	end

	# Devuelve el valor energético en KJ.
	#
	# @return [Float,Array] valor energético en KJ respecto a los 100 gramos. También respecto a la cantidad por porción si las hay.
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

	# Devuelve el valor energético en Kcal.
	#
	# @return [Float,Array] valor energético en Kcal respecto a los 100 gramos. También respecto a la cantidad por porción si las hay.
	def valorEnergeticoEnKcal
		valor = valorEnergeticoEnKJ
		if valor.class == Array
			[(valor[0] / 4.184).round(0) , (valor[1] / 4.184).round(0)]
		else
			(valor / 4.184).round(0)
		end
	end

	# Calcula el porcentaje del valor energético que aporta el alimento sobre el recomendado por día.
	#
	# @return [Float,Array] el porcentaje de valor energético sobre los 100 gramos y también sobre la cantidad por porción si las hay.
	def porcentajeValorEnergetico
		valor = valorEnergeticoEnKcal
		if valor.class == Array
			[((valor[0].to_f / 2000.0) * 100).round(0) , ((valor[1].to_f / 2000.0) * 100).round(0)]
		else
			((valor.to_f / 2000.0) * 100).round(0)
		end
	end

	# Calcula el porcentaje de grasa que aporta el alimento sobre el recomendado por día.
	#
	# @return [Float,Array] el porcentaje de grasa sobre los 100 gramos y también sobre la cantidad por porción si las hay.
	def porcentajeGrasas
		if @porciones > 1
			gramosPorPorcion = @grasas * (@cantidadPorPorcion / 100)
			[((@grasas / 70) * 100).round(0),((gramosPorPorcion / 70) * 100).round(0)]
		else
			((@grasas / 70) * 100).round(0)
		end
	end

	# Calcula el porcentaje de grasas saturadas que aporta el alimento sobre el recomendado por día.
	#
	# @return [Float,Array] el porcentaje de grasas saturadas sobre los 100 gramos y también sobre la cantidad por porción si las hay.
	def porcentajeSaturadas
		if @porciones > 1
			gramosPorPorcion = @grasasSaturadas * (@cantidadPorPorcion / 100)
			[((@grasasSaturadas / 20) * 100).round(0),((gramosPorPorcion / 20) * 100).round(0)]
		else
			((@grasasSaturadas / 20) * 100).round(0)
		end
	end

	# Calcula el porcentaje de hidratos de carbono que aporta el alimento sobre el recomendado por día.
	#
	# @return [Float,Array] el porcentaje de hidratos de carbono sobre los 100 gramos y también sobre la cantidad por porción si las hay.
	def porcentajeHidratos 
		if @porciones > 1
			gramosPorPorcion = @hidratosDeCarbono * (@cantidadPorPorcion / 100)
			[((@hidratosDeCarbono / 260) * 100).round(0),((gramosPorPorcion / 260) * 100).round(0)]
		else
			((@hidratosDeCarbono / 260) * 100).round(0)
		end
	end

	# Calcula el porcentaje de azucares que aporta el alimento sobre el recomendado por día.
	#
	# @return [Float,Array] el porcentaje de azucares sobre los 100 gramos y también sobre la cantidad por porción si las hay.
	def porcentajeAzucares
		if @porciones > 1
			gramosPorPorcion = @azucares * (@cantidadPorPorcion / 100)
			[((@azucares / 90) * 100).round(0),((gramosPorPorcion / 90) * 100).round(0)]
		else
			((@azucares / 90) * 100).round(0)
		end
	end

	# Calcula el porcentaje de proteinas que aporta el alimento sobre el recomendado por día.
	#
	# @return [Float,Array] el porcentaje de proteinas sobre los 100 gramos y también sobre la cantidad por porción si las hay.
	def porcentajeProteinas
		if @porciones > 1
			gramosPorPorcion = @proteinas * (@cantidadPorPorcion / 100)
			[((@proteinas / 50) * 100).round(0),((gramosPorPorcion / 50) * 100).round(0)]
		else
			((@proteinas / 50) * 100).round(0)
		end
	end

	# Calcula el porcentaje de sal que aporta el alimento sobre el recomendado por día.
	#
	# @return [Float,Array] el porcentaje de sal sobre los 100 gramos y también sobre la cantidad por porción si las hay.
	def porcentajeSal
		if @porciones > 1
			gramosPorPorcion = @sal * (@cantidadPorPorcion / 100)
			[((@sal / 6) * 100).round(0),((gramosPorPorcion / 6) * 100).round(0)]
		else
			((@sal / 6) * 100).round(0)
		end
	end
	
	# Formatea los datos en forma de etiqueta, incluyendo los valores por porciones si las hubiera.
	#
	# @return [String] la etiqueta formateada.
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

	# Método necesario para que se pueda comparar la clase, requerido por el módulo Comparable.
	#
	# @param another [Etiqueta] etiqueta con la que se va a comparar.
	# @return [true,false] el resultado de la comparación.
	def <=>(another)
		if another.class == Etiqueta
			valor1 = valorEnergeticoEnKJ
			valor1 = valor1[0] if valor1.class == Array
			valor2 = another.valorEnergeticoEnKJ
			valor2 = valor2[0] if valor2.class == Array
			valor1 <=> valor2
		else
			return false
		end
	end


end
