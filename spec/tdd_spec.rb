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
		Etiqueta.new("Magdalena",21.7,2.6,54.9,29.0,4.8,1.15,0.0,0.0,0.0,0.0,0.0,0.0,0.0)
	end
end
