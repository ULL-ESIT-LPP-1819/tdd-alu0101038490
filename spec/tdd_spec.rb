RSpec.describe Tdd do
  it "has a version number" do
    expect(Tdd::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(true)
  end
end

RSpec.describe Etiqueta do
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
		expect(prueba.valorEnergeticoEnKJ).to eq(1829)
		expect(prueba.valorEnergeticoEnKcal).to eq(437)
	end

	it "calcula correctamente los valores de la tabla" do 
		prueba = Etiqueta.new("Magdalena",21.7,2.6,54.9,29.0,4.8,1.15,0.0,0.0,0.0,0.0,0.0,0.0,0.0)
		#expect(prueba.porcentajeValorEnergetico).to eq()
                expect(prueba.porcentajeGrasas).to eq(31)
                expect(prueba.porcentajeSaturadas).to eq(13)
                expect(prueba.porcentajeHidratos).to eq(21)
                expect(prueba.porcentajeAzucares).to eq(32)
                expect(prueba.porcentajeProteinas).to eq(10)
                expect(prueba.porcentajeSal).to eq(19)

		expect(prueba.to_s).to eq("\tPor 100g\tIR (por 100g)\n" +
					 "Valor energético:\t??/??\t??%\n" +
					 "Grasas:\t21.7g\t31%\n" +
					 "  Saturadas:\t2.6g\t13%\n" +
					 "  Monoinsaturadas:\t0.0g\t-\n" +
					 "  Poliinsaturadas:\t0.0g\t-\n" +
					 "Hidratos:\t54.9g\t21\n" +
					 "  Azucares:\t29.0g\t32%\n" +
					 "  Polialcoholes:\t0.0g\t-\n" +
					 "  Almidón:\t21.7g\t-\n" +
					 "Fibra:\t0.0g\t-\n" +
					 "Proteinas:\t4.8g\t10%\n" +
					 "Sal:\t1.15g\t19%\n" +
					 "Vitaminas:\t0.0g\t-\n" +
					 "Minerales:\t0.0g\t-\n")
	end
end
