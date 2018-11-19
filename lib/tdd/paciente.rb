class Paciente < Individuo

	attr_accessor :peso, :talla, :cintura, :cadera, :tricipital, :bicipital, :subescapular, :suprailíaco

	def initialize(nombre,apellidos,peso,talla,edad,sexo,cintura,cadera,tricipital,bicipital,subescapular,suprailíaco)
        	super(nombre,apellidos,edad,sexo)

        	@peso = peso
        	@talla = talla
        	@cintura = cintura
        	@cadera = cadera
        	@tricipital = tricipital
        	@bicipital = bicipital
        	@subescapular = subescapular
        	@suprailíaco = suprailíaco
    	end

	def imc
		valor = peso / (talla * talla)
		valor.round(2)
	end

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

	def grasa
		1.2 * imc + 0.23 * @edad - 10.8 * ( sexo ? 1 : 0) - 5.4
	end

	def rcc
		valor = @cintura.to_f / @cadera.to_f
		return valor.round(3)
	end

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

	def mediaTricipital
		media = 0.0
		@tricipital.length.times do |i|
		    media += @tricipital[i]
		end
		media /= @tricipital.length.to_f
		media.round(2)
	end

	def mediaBicipital
		media = 0.0
		@bicipital.length.times do |i|
		    media += @bicipital[i]
		end
		media /= @bicipital.length.to_f
		media.round(2)
	end

	def mediaSubescapular
		media = 0.0
		@subescapular.length.times do |i|
		    media += @subescapular[i]
		end
		media /= @subescapular.length.to_f
		media.round(2)
	end

	def mediaSuprailiaco
		media = 0.0
		@suprailíaco.length.times do |i|
		    media += @suprailíaco[i]
		end
		media /= @suprailíaco.length.to_f
		media.round(2)
	end

	def plieguesCutaneos
		pliegues = []
		pliegues << mediaTricipital
		pliegues << mediaBicipital
		pliegues << mediaSubescapular
		pliegues << mediaSuprailiaco
		return pliegues
	end
end
