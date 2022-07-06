$counter = 0

describe "let" do
  let(:count) { $counter += 1 }

  it "memoriza o valor" do
    expect(count).to eq(1) #A primeira e carregada
    expect(count).to eq(1) #A segunda fica armazenada no cache
  end

  it "não é cacheado entre os testes" do
    expect(count).to eq(2)
  end
end