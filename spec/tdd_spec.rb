RSpec.describe Tdd do
  it "has a version number" do
    expect(Tdd::VERSION).not_to be nil
  end
end

RSpec.describe Etiqueta do

	context "cuando no se divide en porciones" do
		
		it "se inicializa correctamente" do
			prueba = Etiqueta.new("Magdalena",21.7,2.6,54.9,29.0,4.8,1.15,0.0,0.0,0.0,0.0,0.0,0.0,0.0)
			expect(prueba.nombre).to eq("Magdalena")
			expect(prueba.grasas).to eq(21.7)
			expect(prueba.grasasSaturadas).to eq(2.6)
			expect(prueba.hidratosDeCarbono).to eq(54.9)
			expect(prueba.azucares).to eq(29.0)
			expect(prueba.proteinas).to eq(4.8)
			expect(prueba.sal).to eq(1.15)
			expect(prueba.grasasMonoinsaturadas).to eq(0.0)
			expect(prueba.grasasPoliinsaturadas).to eq(0.0)
			expect(prueba.polialcoholes).to eq(0.0)
			expect(prueba.almidon).to eq(0.0)
			expect(prueba.fibraAlimentaria).to eq(0.0)
			expect(prueba.vitaminas).to eq(0.0)
			expect(prueba.minerales).to eq(0.0)
		end

		it "calcula correctamente los valores energéticos" do
			prueba = Etiqueta.new("Magdalena",21.7,2.6,54.9,29.0,4.8,1.15,0.0,0.0,0.0,0.0,0.0,0.0,0.0)
			expect(prueba.valorEnergeticoEnKJ).to eq(1406)
			expect(prueba.valorEnergeticoEnKcal).to eq(336)
		end

		it "calcula correctamente los valores de la tabla" do 
			prueba = Etiqueta.new("Magdalena",21.7,2.6,54.9,29.0,4.8,1.15,0.0,0.0,0.0,0.0,0.0,0.0,0.0)
			expect(prueba.porcentajeValorEnergetico).to eq(17)
                	expect(prueba.porcentajeGrasas).to eq(31)
                	expect(prueba.porcentajeSaturadas).to eq(13)
                	expect(prueba.porcentajeHidratos).to eq(21)
                	expect(prueba.porcentajeAzucares).to eq(32)
                	expect(prueba.porcentajeProteinas).to eq(10)
                	expect(prueba.porcentajeSal).to eq(19)

			expect(prueba.to_s).to eq("\tPor 100g\tIR (por 100g)\n" +
					 "Valor energético:\t1406/336\t17%\n" +
					 "Grasas:\t21.7g\t31%\n" +
					 "  Saturadas:\t2.6g\t13%\n" +
					 "  Monoinsaturadas:\t0.0g\t-\n" +
					 "  Poliinsaturadas:\t0.0g\t-\n" +
					 "Hidratos:\t54.9g\t21%\n" +
					 "  Azucares:\t29.0g\t32%\n" +
					 "  Polialcoholes:\t0.0g\t-\n" +
					 "  Almidón:\t0.0g\t-\n" +
					 "Fibra:\t0.0g\t-\n" +
					 "Proteinas:\t4.8g\t10%\n" +
					 "Sal:\t1.15g\t19%\n" +
					 "Vitaminas:\t0.0g\t-\n" +
					 "Minerales:\t0.0g\t-\n")
		end
	end

	context "cuando se divide en porciones" do 
		
		it "se inicializa correctamente" do
			prueba = Etiqueta.new("Magdalena",21.7,2.6,54.9,29.0,4.8,1.15,0.0,0.0,0.0,0.0,0.0,0.0,0.0)
			prueba.dividirEnPorciones(16,60.0)
			expect(prueba.nombre).to eq("Magdalena")
			expect(prueba.grasas).to eq(21.7)
			expect(prueba.grasasSaturadas).to eq(2.6)
			expect(prueba.hidratosDeCarbono).to eq(54.9)
			expect(prueba.azucares).to eq(29.0)
			expect(prueba.proteinas).to eq(4.8)
			expect(prueba.sal).to eq(1.15)
			expect(prueba.grasasMonoinsaturadas).to eq(0.0)
			expect(prueba.grasasPoliinsaturadas).to eq(0.0)
			expect(prueba.polialcoholes).to eq(0.0)
			expect(prueba.almidon).to eq(0.0)
			expect(prueba.fibraAlimentaria).to eq(0.0)
			expect(prueba.vitaminas).to eq(0.0)
			expect(prueba.minerales).to eq(0.0)
			expect(prueba.porciones).to eq(16)
			expect(prueba.cantidadPorPorcion).to eq(60.0)
		end

		it "calcula correctamente los valores energéticos" do
			prueba = Etiqueta.new("Magdalena",21.7,2.6,54.9,29.0,4.8,1.15,0.0,0.0,0.0,0.0,0.0,0.0,0.0)	
			prueba.dividirEnPorciones(16,60.0)
			expect(prueba.valorEnergeticoEnKJ).to eq([1406,844])
			expect(prueba.valorEnergeticoEnKcal).to eq([336,202])
		end


		it "calcula correctamente los valores de la tabla" do 
			prueba = Etiqueta.new("Magdalena",21.7,2.6,54.9,29.0,4.8,1.15,0.0,0.0,0.0,0.0,0.0,0.0,0.0)
			prueba.dividirEnPorciones(16,60.0)
			expect(prueba.porcentajeValorEnergetico).to eq([17,10])
                	expect(prueba.porcentajeGrasas).to eq([31,19])
                	expect(prueba.porcentajeSaturadas).to eq([13,8])
                	expect(prueba.porcentajeHidratos).to eq([21,13])
                	expect(prueba.porcentajeAzucares).to eq([32,19])
                	expect(prueba.porcentajeProteinas).to eq([10,6])
                	expect(prueba.porcentajeSal).to eq([19,12])

			expect(prueba.grasasPorPorcion).to eq(13.02)
			expect(prueba.grasasSaturadasPorPorcion).to eq(1.56)
			expect(prueba.hidratosDeCarbonoPorPorcion).to eq(32.94)
			expect(prueba.azucaresPorPorcion).to eq(17.4)
			expect(prueba.proteinasPorPorcion).to eq(2.88)
			expect(prueba.salPorPorcion).to eq(0.69)
			expect(prueba.grasasMonoinsaturadasPorPorcion).to eq(0.0)
			expect(prueba.grasasPoliinsaturadasPorPorcion).to eq(0.0)
			expect(prueba.polialcoholesPorPorcion).to eq(0.0)
			expect(prueba.almidonPorPorcion).to eq(0.0)
			expect(prueba.fibraAlimentariaPorPorcion).to eq(0.0)
			expect(prueba.vitaminasPorPorcion).to eq(0.0)
			expect(prueba.minerales).to eq(0.0)

			expect(prueba.to_s).to eq("\tPor 100g\tIR (por 100g)\tPor 60.0g\tIR(por 60.0g)\n" +
					 "Valor energético:\t1406/336\t17%\t844/202\t10%\n" +
					 "Grasas:\t21.7g\t31%\t13.02g\t19%\n" +
					 "  Saturadas:\t2.6g\t13%\t1.56g\t8%\n" +
					 "  Monoinsaturadas:\t0.0g\t-\t0.0g\t-\n" +
					 "  Poliinsaturadas:\t0.0g\t-\t0.0g\t-\n" +
					 "Hidratos:\t54.9g\t21%\t32.94\t13%\n" +
					 "  Azucares:\t29.0g\t32%\t17.4g\t19%\n" +
					 "  Polialcoholes:\t0.0g\t-\t0.0g\t-\n" +
					 "  Almidón:\t0.0g\t-\t0.0g\t-\n" +
					 "Fibra:\t0.0g\t-\t0.0g\t-\n" +
					 "Proteinas:\t4.8g\t10%\t2.88g\t6%\n" +
					 "Sal:\t1.15g\t19%\t0.69g\t12%\n" +
					 "Vitaminas:\t0.0g\t-\t0.0g\t-\n" +
					 "Minerales:\t0.0g\t-\t0.0g\t-\n")
		end

	end

	it "comprueba las clases, tipos y la jerarquía." do
		prueba = Etiqueta.new("Magdalena",21.7,2.6,54.9,29.0,4.8,1.15,0.0,0.0,0.0,0.0,0.0,0.0,0.0)
		expect(prueba.class).to eq(Etiqueta)

		expect(prueba.respond_to?('porcentajeSaturadas')).to eq(true)
		expect(prueba.respond_to?('valorEnergeticoEnKJ')).to eq(true)
		expect(prueba.respond_to?('to_s')).to eq(true)

		expect(prueba.class.superclass).to eq(Object)
		expect(prueba.class.ancestors.include?Object).to eq(true)
		expect(prueba.class.ancestors.include?BasicObject).to eq(true)
	end

	it "se compara correctamente." do
		etiqueta1 = Etiqueta.new("Caramelos",6.6,3.9,84.0,70.0,0.8,0.0,0.4,2.3,0.0,0.0,0.0,0.0,0.0)
                etiqueta2 = Etiqueta.new("Galletas saladas",19.0,1.9,67.0,7.1,8.3,1.75,0.0,0.0,0.0,0.0,2.4,0.0,0.0)
                etiqueta3 = Etiqueta.new("Barritas",14.0,8.8,71.0,40.0,5.4,0.39,4.2,0.8,0.0,0.0,0.0,0.0,0.0)
		expect(etiqueta1 < etiqueta2).to eq(false)
		expect(etiqueta1 <= etiqueta2).to eq(false)
		expect(etiqueta1 == etiqueta2).to eq(false)
		expect(etiqueta1 > etiqueta2).to eq(true)
		expect(etiqueta1 >= etiqueta2).to eq(true)
		expect(etiqueta3.between?(etiqueta2,etiqueta1)).to eq(true)
	end	
end

RSpec.describe List do
	
	context "con valores númericos y cadenas" do
		
		it "se inicializa correctamente" do
			lista = List.new
			expect(lista.head).to eq nil
			expect(lista.tail).to eq nil
		end

		it "maneja correctamente los nodos" do
			lista = List.new
			nodo = List::Node.new(1)
			expect(nodo.value).to eq(1)
			expect(nodo.prev).to eq(nil)
			expect(nodo.next).to eq(nil)

			nodo2 = List::Node.new(2,4)
			expect(nodo2.value).to eq(2)
			expect(nodo2.next).to eq(4)
			expect(nodo2.prev).to eq(nil)
		
			nodo3 = List::Node.new("Las cadenas también funcionan.")
			expect(nodo3.value).to eq("Las cadenas también funcionan.")
			expect(nodo3.prev).to eq(nil)
			expect(nodo3.next).to eq(nil)
		
			lista.push_back(nodo)
			lista.push_front(20)
			lista.push_back(nodo2)
			lista.push_front(nodo3)
			lista.push_back(8)

			iterator = lista.head
		
			expect(iterator.value).to eq("Las cadenas también funcionan.")
			iterator = iterator.next
			expect(iterator.value).to eq(20)
			iterator = iterator.next
			expect(iterator.value).to eq(1)
			iterator = iterator.next
			expect(iterator.value).to eq(2)
			iterator = iterator.next
			expect(iterator.value).to eq(8)
			expect(iterator.next).to eq(nil)
			iterator = iterator.prev
			expect(iterator.value).to eq(2)
			iterator = iterator.prev
			expect(iterator.value).to eq(1)
			iterator = iterator.prev
			expect(iterator.value).to eq(20)
			iterator = iterator.prev
			expect(iterator.value).to eq("Las cadenas también funcionan.")
			expect(iterator.prev).to eq(nil)

			lista.pop_back
			lista.pop_back

			iterator = lista.head
			results = [ "Las cadenas también funcionan." , 20 , 1 ]
			results.length.times do |i|
				expect(iterator.value).to eq(results[i])
				iterator = iterator.next
			end
			expect(iterator).to eq(nil)
		
			iterator = lista.tail
			results = [ 1 , 20 , "Las cadenas también funcionan." ]
			results.length.times do |i|
				expect(iterator.value).to eq(results[i])
				iterator = iterator.prev
			end
			expect(iterator).to eq(nil)

			lista.pop_back
			lista.pop_back
			lista.pop_back
			lista.pop_back

			lista.push_back(nodo)
			lista.push_front(20)
			lista.push_back(nodo2)

			lista.pop_front
			lista.pop_front
			expect(lista.head.value).to eq(2)
			expect(lista.tail.value).to eq(lista.head.value)
			expect(lista.head.object_id).to eq(lista.tail.object_id)
			expect(lista.head.next).to eq(nil)
			expect(lista.head.prev).to eq(nil)

			lista.pop_front
			lista.pop_front
		end
	end

	context "con valores de tipo Etiqueta" do
		
		it "maneja correctamente los nodos" do
			lista = List.new
			nodo = List::Node.new(Etiqueta.new("Magdalena",21.7,2.6,54.9,29.0,4.8,1.15,0.0,0.0,0.0,0.0,0.0,0.0,0.0))
			expect(nodo.value.nombre).to eq("Magdalena")

			nodo2 = List::Node.new(Etiqueta.new("Galletas",12.0,2.9,62.0,23.0,8.0,0.57,5.6,3.5,19.5,19.5,12.0,0.0,0.0))
			expect(nodo2.value.nombre).to eq("Galletas")
	
			expect(lista.isEmpty).to eq(true)	
			lista.push_back(nodo)
			expect(lista.isEmpty).to eq(false)
			lista.push_front(Etiqueta.new("Caramelos",6.6,3.9,84.0,70.0,0.8,0.0,0.4,2.3,0.0,0.0,0.0,0.0,0.0))
			lista.push_back(nodo2)
			lista.push_front(Etiqueta.new("Galletas saladas",19.0,1.9,67.0,7.1,8.3,1.75,0.0,0.0,0.0,0.0,2.4,0.0,0.0))
			lista.push_back(Etiqueta.new("Barritas",14.0,8.8,71.0,40.0,5.4,0.39,4.2,0.8,0.0,0.0,0.0,0.0,0.0))
			expect(lista.isEmpty).to eq(false)

			iterator = lista.head
		
			expect(iterator.value.nombre).to eq("Galletas saladas")
			iterator = iterator.next
			expect(iterator.value.nombre).to eq("Caramelos")
			iterator = iterator.next
			expect(iterator.value.nombre).to eq("Magdalena")
			iterator = iterator.next
			expect(iterator.value.nombre).to eq("Galletas")
			iterator = iterator.next
			expect(iterator.value.nombre).to eq("Barritas")
			expect(iterator.next).to eq(nil)
			iterator = iterator.prev
			expect(iterator.value.nombre).to eq("Galletas")
			iterator = iterator.prev
			expect(iterator.value.nombre).to eq("Magdalena")
			iterator = iterator.prev
			expect(iterator.value.nombre).to eq("Caramelos")
			iterator = iterator.prev
			expect(iterator.value.nombre).to eq("Galletas saladas")
			expect(iterator.prev).to eq(nil)

			lista.pop_back
			lista.pop_back
			expect(lista.isEmpty).to eq(false)

			iterator = lista.head
			results = [ "Galletas saladas" , "Caramelos" , "Magdalena" ]
			results.length.times do |i|
				expect(iterator.value.nombre).to eq(results[i])
				iterator = iterator.next
			end
			expect(iterator).to eq(nil)
		
			iterator = lista.tail
			results = [ "Magdalena" , "Caramelos" , "Galletas saladas" ]
			results.length.times do |i|
				expect(iterator.value.nombre).to eq(results[i])
				iterator = iterator.prev
			end
			expect(iterator).to eq(nil)

			lista.pop_back
			lista.pop_back
			lista.pop_back
			lista.pop_back
			expect(lista.isEmpty).to eq(true)

			lista.push_back(nodo)
			expect(lista.isEmpty).to eq(false)
			lista.push_front(Etiqueta.new("Caramelos",6.6,3.9,84.0,70.0,0.8,0.0,0.4,2.3,0.0,0.0,0.0,0.0,0.0))
			lista.push_back(nodo2)
			expect(lista.isEmpty).to eq(false)

			lista.pop_front
			lista.pop_front
			expect(lista.isEmpty).to eq(false)
			expect(lista.head.value.nombre).to eq("Galletas")
			expect(lista.tail.value.nombre).to eq(lista.head.value.nombre)
			expect(lista.head.object_id).to eq(lista.tail.object_id)
			expect(lista.head.next).to eq(nil)
			expect(lista.head.prev).to eq(nil)

			lista.pop_front
			expect(lista.isEmpty).to eq(true)

			lista.insert(0,Etiqueta.new("Caramelos",6.6,3.9,84.0,70.0,0.8,0.0,0.4,2.3,0.0,0.0,0.0,0.0,0.0))
			expect(lista.isEmpty).to eq(false)
			lista.insert(1,nodo)
			expect(lista.isEmpty).to eq(false)
			lista.insert(2,Etiqueta.new("Barritas",14.0,8.8,71.0,40.0,5.4,6.39,4.2,0.8,0.0,0.0,0.0,0.0,0.0))
			lista.insert(0,Etiqueta.new("Galletas saladas",19.0,1.9,67.0,7.1,8.3,20.75,0.0,0.0,0.0,0.0,2.4,0.0,0.0))
			lista.insert(3,nodo2)
			expect(lista.isEmpty).to eq(false)

			iterator = lista.head
		
			expect(iterator.value.nombre).to eq("Galletas saladas")
			iterator = iterator.next
			expect(iterator.value.nombre).to eq("Caramelos")
			iterator = iterator.next
			expect(iterator.value.nombre).to eq("Magdalena")
			iterator = iterator.next
			expect(iterator.value.nombre).to eq("Galletas")
			iterator = iterator.next
			expect(iterator.value.nombre).to eq("Barritas")
			expect(iterator.next).to eq(nil)
			iterator = iterator.prev
			expect(iterator.value.nombre).to eq("Galletas")
			iterator = iterator.prev
			expect(iterator.value.nombre).to eq("Magdalena")
			iterator = iterator.prev
			expect(iterator.value.nombre).to eq("Caramelos")
			iterator = iterator.prev
			expect(iterator.value.nombre).to eq("Galletas saladas")
			expect(iterator.prev).to eq(nil)

			iterator = lista.head
			salAdecuada = []
			salInadecuada = []
			while iterator != nil do
				if iterator.value.porcentajeSal <= 100
					salAdecuada.push(iterator.value.sal)
				else 
					salInadecuada.push(iterator.value.sal)
				end
				iterator = iterator.next
			end
			expect(salAdecuada).to eq([0.0,1.15,0.57])
			expect(salInadecuada).to eq([20.75,6.39])

			lista.remove(1)
			lista.remove(2)
			expect(lista.isEmpty).to eq(false)

			iterator = lista.head

			expect(iterator.value.nombre).to eq("Galletas saladas")
			iterator = iterator.next
			expect(iterator.value.nombre).to eq("Magdalena")
			iterator = iterator.next
			expect(iterator.value.nombre).to eq("Barritas")
			expect(iterator.next).to eq(nil)
			iterator = iterator.prev
			expect(iterator.value.nombre).to eq("Magdalena")
			iterator = iterator.prev
			expect(iterator.value.nombre).to eq("Galletas saladas")
			expect(iterator.prev).to eq(nil)

			lista.remove(0)
			lista.remove(1)
			expect(lista.isEmpty).to eq(false)

			iterator = lista.head

			expect(iterator.value.nombre).to eq("Magdalena")
			expect(iterator.next).to eq(nil)
			expect(iterator.prev).to eq(nil)
			expect(iterator).to eq(lista.head)
			expect(lista.head).to eq(lista.tail)

			lista.remove(0)
			expect(lista.isEmpty).to eq(true)

		end
	end

	it "comprueba las clases, tipos y la jerarquía." do
		prueba = List.new
		expect(prueba.class).to eq(List)

		expect(prueba.respond_to?('push_back')).to eq(true)
		expect(prueba.respond_to?('insert')).to eq(true)
		expect(prueba.respond_to?('remove')).to eq(true)

		expect(prueba.class.superclass).to eq(Object)
		expect(prueba.class.ancestors.include?Object).to eq(true)
		expect(prueba.class.ancestors.include?BasicObject).to eq(true)
	end

	it "se hacen enumeraciones correctamente." do
		lista = List.new
		etiqueta1 = Etiqueta.new("Caramelos",6.6,3.9,84.0,70.0,0.8,0.0,0.4,2.3,0.0,0.0,0.0,0.0,0.0)
                etiqueta2 = Etiqueta.new("Galletas saladas",19.0,1.9,67.0,7.1,8.3,1.75,0.0,0.0,0.0,0.0,2.4,0.0,0.0)
                etiqueta3 = Etiqueta.new("Barritas",14.0,8.8,71.0,40.0,5.4,0.39,4.2,0.8,0.0,0.0,0.0,0.0,0.0)
		lista.push_back(etiqueta1)
		lista.push_back(etiqueta2)
		lista.push_back(etiqueta3)

		expect(lista.collect {"prueba"}).to eq(["prueba","prueba","prueba"])
		expect(lista.select { |aux| aux.grasas > 10.0}).to eq([etiqueta2,etiqueta3])
		expect(lista.max).to eq(etiqueta1)
		expect(lista.min).to eq(etiqueta2)
		expect(lista.sort).to eq([etiqueta2,etiqueta3,etiqueta1])

		lista.pop_back
		lista.pop_back
		lista.pop_back

		paciente1 = Paciente.new("Jorge","González Cabrera",70,1.85,20,true,80,90,[50,48,53],[20,19,17],[84,87,85],[30,34,33],0)
		paciente2 = Paciente.new("Jorge","González Cabrera",66.424,1.9,20,true,75.87,90,[50,48,53],[20,19,17],[84,87,85],[30,34,33],0)
		paciente3 = Paciente.new("Jorge","González Cabrera",86.81416,1.78,20,true,88.83,90,[50,48,53],[20,19,17],[84,87,85],[30,34,33],0)
		lista.push_back(paciente1)
		lista.push_back(paciente2)
		lista.push_back(paciente3)

		expect(lista.collect {"prueba"}).to eq(["prueba","prueba","prueba"])
		expect(lista.select { |aux| aux.peso >= 70.0}).to eq([paciente1,paciente3])
		expect(lista.max).to eq(paciente3)
		expect(lista.min).to eq(paciente2)
		expect(lista.sort).to eq([paciente2,paciente1,paciente3])
	end	
end


RSpec.describe "Pruebas sobre la herencia" do
	
	it "crea correctamente la clase Individuo" do
		persona1 = Individuo.new("Jorge","González Cabrera", 20, true)
		expect(persona1.nombre).to eq("Jorge")
		expect(persona1.apellidos).to eq("González Cabrera")
		expect(persona1.edad).to eq(20)
		expect(persona1.sexo).to eq(true)
	end

	it "crea correctamente la clase Paciente" do
		paciente1 = Paciente.new("Jorge","González Cabrera",70,1.85,20,true,80,90,[50,48,53],[20,19,17],[84,87,85],[30,34,33],0)
		expect(paciente1.nombre).to eq("Jorge")
		expect(paciente1.apellidos).to eq("González Cabrera")
		expect(paciente1.edad).to eq(20)
		expect(paciente1.sexo).to eq(true)
		expect(paciente1.peso).to eq(70)
		expect(paciente1.talla).to eq(1.85)
		expect(paciente1.cintura).to eq(80)
		expect(paciente1.cadera).to eq(90)
		expect(paciente1.tricipital).to eq([50,48,53])
		expect(paciente1.bicipital).to eq([20,19,17])
		expect(paciente1.subescapular).to eq([84,87,85])
		expect(paciente1.suprailíaco).to eq([30,34,33])
	end

	it "calcula correctamente los valores antropométricos del paciente" do
		prueba1 = Paciente.new("Jorge","González Cabrera",70,1.85,20,true,80,90,[50,48,53],[20,19,17],[84,87,85],[30,34,33],0)
        	prueba2 = Paciente.new("Jorge","González Cabrera",66.424,1.9,20,true,75.87,90,[50,48,53],[20,19,17],[84,87,85],[30,34,33],0)
        	prueba3 = Paciente.new("Jorge","González Cabrera",86.81416,1.78,20,true,88.83,90,[50,48,53],[20,19,17],[84,87,85],[30,34,33],0)
        	prueba4 = Paciente.new("Jorge","González Cabrera",86.60512,1.64,20,true,93.5,85,[50,48,53],[20,19,17],[84,87,85],[30,34,33],0)
        	prueba5 = Paciente.new("Jorge","González Cabrera",120.710637,1.77,20,false,75.17,102,[50,48,53],[20,19,17],[84,87,85],[30,34,33],0)
        	prueba6 = Paciente.new("Jorge","González Cabrera",147.72492,1.86,20,false,75.7152,95.6,[50,48,53],[20,19,17],[84,87,85],[30,34,33],0)
        	prueba7 = Paciente.new("Jorge","González Cabrera",70,1.85,20,false,0.73863,0.87,[50,48,53],[20,19,17],[84,87,85],[30,34,33],0)

		expect(prueba1.imc_s).to eq("20.45 (Adecuado)")
		expect(prueba2.imc_s).to eq("18.4 (Bajo peso)")
		expect(prueba3.imc_s).to eq("27.4 (Sobrepeso)")
		expect(prueba4.imc_s).to eq("32.2 (Obesidad grado 1)")
		expect(prueba5.imc_s).to eq("38.53 (Obesidad grado 2)")
		expect(prueba6.imc_s).to eq("42.7 (Obesidad grado 3)")
		
		expect(prueba1.grasa.round(2)).to eq(12.94)

		expect(prueba1.rcc_s).to eq("0.889 (Moderado)")
		expect(prueba2.rcc_s).to eq("0.843 (Bajo)")
		expect(prueba3.rcc_s).to eq("0.987 (Alto)")
		expect(prueba4.rcc_s).to eq("1.1 (Muy alto)")
		expect(prueba5.rcc_s).to eq("0.737 (Bajo)")
		expect(prueba6.rcc_s).to eq("0.792 (Moderado)")
		expect(prueba7.rcc_s).to eq("0.849 (Alto)")

		expect(prueba1.plieguesCutaneos).to eq([50.33,18.67,85.33,32.33])
	end

	it "muestra correctamente los datos" do
		persona1 = Individuo.new("Jorge","González Cabrera", 20, true)
		paciente1 = Paciente.new("Jorge","González Cabrera",70,1.85,20,true,80,90,[50,48,53],[20,19,17],[84,87,85],[30,34,33],0)

		expect(persona1.to_s).to eq("\n  Jorge González Cabrera, hombre, 20 años")
		expect(paciente1.to_s).to eq("\n  Jorge González Cabrera, hombre, 20 años" +
					       "\n  Datos antropométricos" +
					       "\tPeso: 70kg\tTalla: 1.85m" +
					       "\tIMC: 20.45 (Adecuado)\tPorcentaje de grasa: 12.94%" +
					       "\n  Circunferencias" +
					       "\tCintura: 80 cm\tCadera: 90 cm" +
					       "\tRCC: 0.889 (Moderado)" +
					       "\n  Medidas cutáneas del tricipital" +
					       "\tMedida  1: 50cm" +
					       "\tMedida  2: 48cm" +
					       "\tMedida  3: 53cm" +
					       "\tMedia: 50.33cm" +
					       "\n  Medidas cutáneas del bicipital" +
					       "\tMedida  1: 20cm" +
                                               "\tMedida  2: 19cm" +
                                               "\tMedida  3: 17cm" +
					       "\tMedia: 18.67cm" +
					       "\n  Medidas cutáneas del subescapular" +
					       "\tMedida  1: 84cm" +
                                               "\tMedida  2: 87cm" +
                                               "\tMedida  3: 85cm" +
					       "\tMedia: 85.33cm" +
					       "\n  Medidas cutáneas del suprailíaco" +
					       "\tMedida  1: 30cm" +
                                               "\tMedida  2: 34cm" +
                                               "\tMedida  3: 33cm" +
					       "\tMedia: 32.33cm")
	end

	it "clasifica correctamente a los pacientes según su IMC" do
		pacientes = List.new
		pacientes.push_back(Paciente.new("Jorge","González Cabrera",70,1.85,20,true,80,90,[50,48,53],[20,19,17],[84,87,85],[30,34,33],0))
		pacientes.push_back(Paciente.new("Jorge","González Cabrera",66.424,1.9,20,true,75.87,90,[50,48,53],[20,19,17],[84,87,85],[30,34,33],0))
		pacientes.push_back(Paciente.new("Jorge","González Cabrera",86.81416,1.78,20,true,88.83,90,[50,48,53],[20,19,17],[84,87,85],[30,34,33],0))
		pacientes.push_back(Paciente.new("Jorge","González Cabrera",86.60512,1.64,20,true,93.5,85,[50,48,53],[20,19,17],[84,87,85],[30,34,33],0))
		pacientes.push_back(Paciente.new("Jorge","González Cabrera",100.710637,1.77,20,false,75.17,102,[50,48,53],[20,19,17],[84,87,85],[30,34,33],0))
		pacientes.push_back(Paciente.new("Jorge","González Cabrera",147.72492,1.86,20,false,75.7152,95.6,[50,48,53],[20,19,17],[84,87,85],[30,34,33],0))
		pacientes.push_back(Paciente.new("Jorge","González Cabrera",68,1.85,20,false,0.73863,0.87,[50,48,53],[20,19,17],[84,87,85],[30,34,33],0))

		pesosBajos = []
		adecuados = []
		sobrepeso = []
		obesidadGradoUno = []
		obesidadGradoDos = []
		obesidadGradoTres = []

		iterator = pacientes.head
		while iterator != nil do
			valor = iterator.value.imc
			if valor < 18.5
				pesosBajos.push(valor)
			elsif valor >= 18.5 && valor < 25
				adecuados.push(valor)
			elsif valor >= 25 && valor < 30
				sobrepeso.push(valor)
			elsif valor >= 30 && valor < 35
				obesidadGradoUno.push(valor)
			elsif valor >= 35 && valor < 40
				obesidadGradoDos.push(valor)
			elsif valor >= 40
				obesidadGradoTres.push(valor)
			end
			iterator = iterator.next
		end
		expect(pesosBajos).to eq([18.4])
		expect(adecuados).to eq([20.45,19.87])
		expect(sobrepeso).to eq([27.4])
		expect(obesidadGradoUno).to eq([32.2,32.15])
		expect(obesidadGradoDos).to eq([])
		expect(obesidadGradoTres).to eq([42.7])

	end

	it "comprobación de clases, tipos y pertenencia a una jerarquía" do
		persona1 = Individuo.new("Jorge","González Cabrera", 20, true)
		paciente1 = Paciente.new("Jorge","González Cabrera",70,1.85,20,true,80,90,[50,48,53],[20,19,17],[84,87,85],[30,34,33],0)

		expect(paciente1.class).to eq(Paciente)
		expect(paciente1.class).to_not eq(Individuo)
		expect(persona1.class).to eq(Individuo)
		expect(persona1.class).to_not eq(Paciente)

		expect(paciente1.respond_to?('imc_s')).to eq(true)
		expect(persona1.respond_to?('imc_s')).to eq(false)
		expect(paciente1.respond_to?('rcc_s')).to eq(true)
		expect(persona1.respond_to?('rcc_s')).to eq(false)
		expect(paciente1.respond_to?('to_s')).to eq(true)
		expect(persona1.respond_to?('to_s')).to eq(true)

		expect(paciente1.class.superclass).to eq(Individuo)
		expect(paciente1.class.ancestors.include?Individuo).to eq(true)
		expect(paciente1.class.ancestors.include?Object).to eq(true)
		expect(paciente1.class.ancestors.include?BasicObject).to eq(true)
	end

	it "se compara correctamente." do
		paciente1 = Paciente.new("Jorge","González Cabrera",70,1.85,20,true,80,90,[50,48,53],[20,19,17],[84,87,85],[30,34,33],0)
		paciente2 = Paciente.new("Jorge","González Cabrera",66.424,1.9,20,true,75.87,90,[50,48,53],[20,19,17],[84,87,85],[30,34,33],0)
		paciente3 = Paciente.new("Jorge","González Cabrera",86.81416,1.78,20,true,88.83,90,[50,48,53],[20,19,17],[84,87,85],[30,34,33],0)
		expect(paciente1 < paciente2).to eq(false)
		expect(paciente1 <= paciente2).to eq(false)
		expect(paciente1 == paciente2).to eq(false)
		expect(paciente1 > paciente2).to eq(true)
		expect(paciente1 >= paciente2).to eq(true)
		expect(paciente1.between?(paciente2,paciente3)).to eq(true)
	end

	it "comprueba correctamente la valoración nutricional." do
                menu1 = List.new
		menu2 = List.new
		menu3 = List.new
		menu4 = List.new
		menu5 = List.new

                etiqueta1 = Etiqueta.new("Magdalena",21.7,2.6,54.9,29.0,4.8,1.15,0.0,0.0,0.0,0.0,0.0,0.0,0.0)
                etiqueta2 = Etiqueta.new("Galletas",12.0,2.9,62.0,23.0,8.0,0.57,5.6,3.5,19.5,19.5,12.0,0.0,0.0)
                etiqueta3 = Etiqueta.new("Caramelos",6.6,3.9,84.0,70.0,0.8,0.0,0.4,2.3,0.0,0.0,0.0,0.0,0.0)
                etiqueta4 = Etiqueta.new("Galletas saladas",19.0,1.9,67.0,7.1,8.3,1.75,0.0,0.0,0.0,0.0,2.4,0.0,0.0)
                etiqueta5 = Etiqueta.new("Barritas",14.0,8.8,71.0,40.0,5.4,0.39,4.2,0.8,0.0,0.0,0.0,0.0,0.0)
		etiqueta6 = Etiqueta.new("Carne",13.0,4.5,1,0.5,17,0.6,0.0,0.0,0.0,0.0,0.0,0.0,0.0)

		menu1.push_back(etiqueta1)
		menu1.push_back(etiqueta2)

		menu2.push_back(etiqueta1)
		menu2.push_back(etiqueta6)

		menu3.push_back(etiqueta1)
		menu3.push_back(etiqueta2)
		menu3.push_back(etiqueta3)

		menu4.push_back(etiqueta1)
		menu4.push_back(etiqueta2)
		menu4.push_back(etiqueta4)
		menu4.push_back(etiqueta5)

		menu5.push_back(etiqueta2)
		menu5.push_back(etiqueta5)

                paciente1 = Paciente.new("Jorge","González Cabrera",70,1.85,20,true,80,90,[50,48,53],[20,19,17],[84,87,85],[30,34,33],0)
		expect(menu1.inject(0) { |sum, n| sum + n.valorEnergeticoEnKcal }).to be_between(paciente1.gastoEnergeticoTotal * 0.9,paciente1.gastoEnergeticoTotal * 1.1).inclusive
		paciente2 = Paciente.new("Jorge","González Cabrera",66.424,1.9,43,true,75.87,90,[50,48,53],[20,19,17],[84,87,85],[30,34,33],0.12)
		expect(menu2.inject(0) { |sum, n| sum + n.valorEnergeticoEnKcal }).to be_between(paciente2.gastoEnergeticoTotal * 0.9,paciente2.gastoEnergeticoTotal * 1.1).inclusive
		paciente3 = Paciente.new("Jorge","González Cabrera",86.81416,1.78,28,true,88.83,90,[50,48,53],[20,19,17],[84,87,85],[30,34,33],0.27)
		expect(menu3.inject(0) { |sum, n| sum + n.valorEnergeticoEnKcal }).to be_between(paciente3.gastoEnergeticoTotal * 0.9,paciente3.gastoEnergeticoTotal * 1.1).inclusive
		paciente4 = Paciente.new("Jorge","González Cabrera",86.60512,1.64,15,true,93.5,85,[50,48,53],[20,19,17],[84,87,85],[30,34,33],0.54)
		expect(menu4.inject(0) { |sum, n| sum + n.valorEnergeticoEnKcal }).to be_between(paciente4.gastoEnergeticoTotal * 0.9,paciente4.gastoEnergeticoTotal * 1.1).inclusive
		paciente5 = Paciente.new("Jorge","González Cabrera",100.710637,1.77,60,false,75.17,102,[50,48,53],[20,19,17],[84,87,85],[30,34,33],0.12)
		expect(menu5.inject(0) { |sum, n| sum + n.valorEnergeticoEnKcal }).to be_between(paciente5.gastoEnergeticoTotal * 0.9,paciente5.gastoEnergeticoTotal * 1.1).inclusive
        end	

end
