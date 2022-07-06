require 'pessoa'

describe 'Atributos' do

   # before(:each) do
   #   @pessoa = Pessoa.new
   # end

   let(:pessoa) { Pessoa.new }

   it 'have_attributes' do
     pessoa.nome = "Vitor"
     pessoa.idade = 19

     expect(pessoa).to have_attributes( nome: a_string_starting_with("V"), idade: (a_value >= 19) )
   end

   it 'have_attributes' do
     pessoa.nome = "Ricardo"
     pessoa.idade = 24

     expect(pessoa).to have_attributes( nome: a_string_starting_with("R"), idade: (a_value >= 24) )
   end
end