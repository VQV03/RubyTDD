require 'pessoa'

describe 'Atributos' do

  before(:context) do
    puts ">>>>>>>>>> Antes de todos os testes"
  end

  after(:all) do
    puts ">>>>>>>>>>>>> Depois de todos os testes"
  end

  # before(:each) do
  #   puts "Antes"
  #   @pessoa = Pessoa.new
  # end

  # after(:each) do
  #   @pessoa.nome = "Sem Nome" 
  #   puts "Depois >>>>>>>> #{@pessoa.inspect}"
  # end

  around(:each) do |teste|
    puts "Antes"
    @pessoa = Pessoa.new

    teste.run #Roda os testes

    @pessoa.nome = "Sem Nome" 
    puts "Depois >>>>>>>> #{@pessoa.inspect}"
  end

  it 'have_attributes' do
    pessoa = Pessoa.new
    pessoa.nome = "Vitor"
    pessoa.idade = 19

    expect(pessoa).to have_attributes(nome: a_string_starting_with("V"), idade: (a_value >= 19))
   end

  it 'have_attributes' do
    pessoa = Pessoa.new
    pessoa.nome = "Ricardo"
    pessoa.idade = 24

    expect(pessoa).to have_attributes(nome: a_string_starting_with("R"), idade: (a_value >= 24))
  end
end
