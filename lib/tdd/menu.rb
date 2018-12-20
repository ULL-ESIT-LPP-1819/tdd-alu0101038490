
class Menu 

	attr_reader :day, :titulo, :ingesta, :desayuno, :almuerzo, :cena

	def initialize(day, &block)
		@day = day
		@ingesta = []
		@desayuno = []
		@almuerzo = []
		@cena = []

		if block_given?  
      			if block.arity == 1
       				yield self
      			else
       				instance_eval(&block) 
      			end
    		end
	end

	def titulo (nombre)
		@titulo = nombre
	end

	def ingesta (range)
		if(range[:min] && range[:max])
			@ingesta.clear
			@ingesta << range[:min]
			@ingesta << range[:max]
		end
	end

	def desayuno (meal)
		if meal.keys == ([:descripcion,:porcion,:gramos,:grasas,:carbohidratos,:proteinas,:fibra,:sal])
			@desayuno << meal
		end
	end

	def almuerzo (meal)
		if meal.keys == ([:descripcion,:porcion,:gramos,:grasas,:carbohidratos,:proteinas,:fibra,:sal])
                        @almuerzo << meal
		end
	end

	def cena (meal)
		if meal.keys == ([:descripcion,:porcion,:gramos,:grasas,:carbohidratos,:proteinas,:fibra,:sal])
                        @cena << meal
		end
	end

	def to_s
		kJulTotal = 0
		result = "" + @day + "\tComposición nutricional," + @titulo + "\n"
		result += ("=" * result.length) + "\n" +
		"\tgrasas\tcarbohidratos\tproteínas\tfibra\tsal\tvalor\tenergético\n" +
		"Desayuno\n"
		@desayuno.each do |i|
			kJul = (37 * i[:grasas]) + (8 * i[:fibra]) + (17 * i[:proteinas]) + (25 * i[:sal]) + (17 * i[:carbohidratos])
			result += i[:descripcion] + "\t" + i[:grasas].round(2).to_s + "\t" + i[:carbohidratos].round(2).to_s + "\t" + i[:proteinas].round(2).to_s + "\t" + i[:fibra].round(2).to_s + "\t" + i[:sal].round(2).to_s + "\t" + kJul.round(2).to_s + "\n"
			kJulTotal += kJul
		end
		result += "Almuerzo\n"
		@almuerzo.each do |i|
                        kJul = (37 * i[:grasas]) + (8 * i[:fibra]) + (17 * i[:proteinas]) + (25 * i[:sal]) + (17 * i[:carbohidratos])
			result += i[:descripcion] + "\t" + i[:grasas].round(2).to_s + "\t" + i[:carbohidratos].round(2).to_s + "\t" + i[:proteinas].round(2).to_s + "\t" + i[:fibra].round(2).to_s + "\t" + i[:sal].round(2).to_s + "\t" + kJul.round(2).to_s + "\n"
			kJulTotal += kJul
                end
		result += "Cena\n"
                @cena.each do |i|
                        kJul = (37 * i[:grasas]) + (8 * i[:fibra]) + (17 * i[:proteinas]) + (25 * i[:sal]) + (17 * i[:carbohidratos])
			result += i[:descripcion] + "\t" + i[:grasas].round(2).to_s + "\t" + i[:carbohidratos].round(2).to_s + "\t" + i[:proteinas].round(2).to_s + "\t" + i[:fibra].round(2).to_s + "\t" + i[:sal].round(2).to_s + "\t" + kJul.round(2).to_s + "\n"
			kJulTotal += kJul
                end
		result += "Valor energético total\t" + kJulTotal.round(2).to_s	

	end

end
