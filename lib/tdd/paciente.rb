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

end
