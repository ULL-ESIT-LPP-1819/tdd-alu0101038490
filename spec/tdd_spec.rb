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
end

RSpec.describe List do
	
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
	end
end
