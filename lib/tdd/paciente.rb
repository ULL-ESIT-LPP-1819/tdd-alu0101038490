# Clase para describir el valor nutricional de un alimento.
# 
# @author Jorge González Cabrera
#
# @!attribute [rw] peso
#   @return [Float] el peso del paciente en kilogramos.
# @!attribute [rw] talla
#   @return [Float] la altura del paciente en metros.
# @!attribute [rw] cintura
#   @return [Float] medida de la cintura en centímetros.
# @!attribute [rw] cadera
#   @return [Float] medida de la cadera en centímetros.
# @!attribute [rw] tricipital
#   @return [Array<Float>] medidas tricipitales en centímetros.
# @!attribute [rw] bicipital
#   @return [Array<Float>] medidas bicipitales en centímetros.
# @!attribute [rw] subescapular
#   @return [Array<Float>] medidas subescapulares en centímetros.
# @!attribute [rw] suprailiaco
#   @return [Array<Float>] medidas suprailiacas en centímetros.
# @!attribute [rw] factorActividadFisica
#   @return [0.0,0.12,0.27,0.54] factor de actividad física.

class Paciente < Individuo

	include Comparable

	attr_accessor :peso, :talla, :cintura, :cadera, :tricipital, :bicipital, :subescapular, :suprailíaco, :factorActividadFisica

	# Crea un objeto de tipo paciente con todos los datos.
	#
	# @return [Paciente]
	def initialize(nombre,apellidos,peso,talla,edad,sexo,cintura,cadera,tricipital,bicipital,subescapular,suprailíaco, factorActividadFisica)
        	super(nombre,apellidos,edad,sexo)

        	@peso = peso
        	@talla = talla
        	@cintura = cintura
        	@cadera = cadera
        	@tricipital = tricipital
        	@bicipital = bicipital
        	@subescapular = subescapular
        	@suprailíaco = suprailíaco
		@factorActividadFisica = factorActividadFisica
    	end

	# Calcula el índice de masa corporal del paciente.
	#
	# @return [Float] el IMC del paciente.
	def imc
		valor = peso / (talla * talla)
		valor.round(2)
	end

	# Calcula el índice de masa corporal del paciente y lo clasifica.
	#
	# @return [String] IMC formateado.
	def imc_s
		valor = imc
		if valor < 18.5
		    "#{valor} (Bajo peso)"
		elsif valor >= 18.5 && valor < 25
		    "#{valor} (Adecuado)"
		elsif valor >= 25 && valor < 30
		    "#{valor} (Sobrepeso)"
		elsif valor >= 30 && valor < 35
		    "#{valor} (Obesidad grado 1)"
		elsif valor >= 35 && valor < 40
		    "#{valor} (Obesidad grado 2)"
		elsif valor >= 40
		    "#{valor} (Obesidad grado 3)"
		end
	end

	# Calcula la cantidad de grasa del paciente.
	#
	# @return [Float] la cantidad de grasa del paciente.
	def grasa
		1.2 * imc + 0.23 * @edad - 10.8 * ( sexo ? 1 : 0) - 5.4
	end

	# Calcula la relación cintura-cadera del paciente.
	#
	# @return [Float] la relación cintura-cadera del paciente.
	def rcc
		valor = @cintura.to_f / @cadera.to_f
		return valor.round(3)
	end

	# Calcula la relación cintura-cadera del paciente y lo clasifica.
	#
	# @return [String] RCC formateado.
	def rcc_s
		valor = rcc
		if sexo
		    if valor >= 0.83 && valor <= 0.88
			"#{valor} (Bajo)"
		    elsif valor >= 0.88 && valor <= 0.95
			"#{valor} (Moderado)"
		    elsif valor >= 0.95 && valor <= 1.01
			"#{valor} (Alto)"
		    elsif valor > 1.01
			"#{valor} (Muy alto)"
		    else
			"#{valor} (Fuera de rango)"
		    end
		else
		    if valor >= 0.72 && valor <= 0.75
			"#{valor} (Bajo)"
		    elsif valor >= 0.78 && valor <= 0.82
			"#{valor} (Moderado)"
		    elsif valor > 0.82
			"#{valor} (Alto)"
		    else
			"#{valor} (Fuera de rango)"
		    end
		end
	end

	# Calcula la media de todas las medidas tricipitales dadas.
	#
	# @return [Float] media de medidas tricipitales.
	def mediaTricipital
		media = 0.0
		@tricipital.length.times do |i|
		    media += @tricipital[i]
		end
		media /= @tricipital.length.to_f
		media.round(2)
	end

	# Calcula la media de todas las medidas bicipitales dadas.
	#
	# @return [Float] media de medidas bicipitales.
	def mediaBicipital
		media = 0.0
		@bicipital.length.times do |i|
		    media += @bicipital[i]
		end
		media /= @bicipital.length.to_f
		media.round(2)
	end

	# Calcula la media de todas las medidas subescapulares dadas.
	#
	# @return [Float] media de medidas subescapulares.
	def mediaSubescapular
		media = 0.0
		@subescapular.length.times do |i|
		    media += @subescapular[i]
		end
		media /= @subescapular.length.to_f
		media.round(2)
	end

	# Calcula la media de todas las medidas suprailiacas dadas.
	#
	# @return [Float] media de medidas suprailiacas.
	def mediaSuprailiaco
		media = 0.0
		@suprailíaco.length.times do |i|
		    media += @suprailíaco[i]
		end
		media /= @suprailíaco.length.to_f
		media.round(2)
	end

	# Calcula todas las medias de las medidas tricipitales, bicipitales, subescapulares y suprailiacas.
	#
	# @return [Array<Float>] media de medidas.
	def plieguesCutaneos
		pliegues = []
		pliegues << mediaTricipital
		pliegues << mediaBicipital
		pliegues << mediaSubescapular
		pliegues << mediaSuprailiaco
		return pliegues
	end

	# Formatea los datos en forma de parte médico con todos los datos del paciente.
	#
	# @return [String] los datos del paciente formateados.
	def to_s
		medias = plieguesCutaneos
		pliegues_s = "\n  Medidas cutáneas del tricipital"
		@tricipital.length.times do |i|
		    pliegues_s += "\tMedida  #{i+1}: #{@tricipital[i]}cm"
		end
		pliegues_s += "\tMedia: #{medias[0]}cm"

		pliegues_s += "\n  Medidas cutáneas del bicipital"
		@bicipital.length.times do |i|
		    pliegues_s += "\tMedida  #{i+1}: #{@bicipital[i]}cm"
		end
		pliegues_s += "\tMedia: #{medias[1]}cm"

		pliegues_s += "\n  Medidas cutáneas del subescapular"
		@subescapular.length.times do |i|
		    pliegues_s += "\tMedida  #{i+1}: #{@subescapular[i]}cm"
		end
		pliegues_s += "\tMedia: #{medias[2]}cm"

		pliegues_s += "\n  Medidas cutáneas del suprailíaco"
		@suprailíaco.length.times do |i|
		    pliegues_s += "\tMedida  #{i+1}: #{@suprailíaco[i]}cm"
		end
		pliegues_s += "\tMedia: #{medias[3]}cm"

		super.to_s +
		"\n  Datos antropométricos" +
	       "\tPeso: #{@peso}kg\tTalla: #{@talla}m" +
		"\tIMC: #{imc_s}\tPorcentaje de grasa: #{grasa}%" +
		"\n  Circunferencias" +
		"\tCintura: #{@cintura} cm\tCadera: #{@cadera} cm" +
		"\tRCC: #{rcc_s}" +
		pliegues_s
	end

	# Método necesario para que se pueda comparar la clase, requerido por el módulo Comparable.
	#
	# @param another [Paciente] paciente con la que se va a comparar.
	# @return [true,false] el resultado de la comparación.
	def <=>(another)
		imc <=> another.imc
	end

	# Método para calcular el gasto energético total (por día) en calorías del paciente.
	#
	# @return [Float] el gasto energético total.
	def gastoEnergeticoTotal
		if sexo
			return (10 * @peso + 6.25 * @talla - 5 * @edad + 5) + ((10 * @peso + 6.25 * @talla - 5 * @edad + 5) * 0.10) + ((10 * @peso + 6.25 * @talla - 5 * @edad + 5) * @factorActividadFisica)
		else 	
			return (10 * @peso + 6.25 * @talla - 5 * @edad - 161) + ((10 * @peso + 6.25 * @talla - 5 * @edad - 161) * 0.10) + ((10 * @peso + 6.25 * @talla - 5 * @edad + -161) * @factorActividadFisica)
		end
	end
end
