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
end
