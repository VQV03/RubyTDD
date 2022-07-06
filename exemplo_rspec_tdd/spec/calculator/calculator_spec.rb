require "calculator.rb"

#Para usar o rpec fora de arquivos _spec, precisa-se invocar o RSpec, por ex: RSpec.describe
 
describe Calculator, "Sobre a calculadora" do

    subject (:calc) { Calculator.new() } 

    context "#div" do
        it "divide by 0" do
            expect{subject.div(3, 0)}.to raise_error(ZeroDivisionError)
            expect{subject.div(3, 0)}.to raise_error("divided by 0")
            expect{subject.div(3, 0)}.to raise_error(ZeroDivisionError, "divided by 0")
        end
    end

    context "#sum" do  
        it "with positive numbers" do
            result = calc.sum(5, 7)
            expect(result).to eq(12) 
        end

        it "with negative and positive numbers" do
            result = calc.sum(-5, 7)
            expect(result).to eq(2) 
        end

        it "with negative numbers" do
            result = calc.sum(-5, -7)
            expect(result).to eq(-12) 
        end
    end
end


#xit e para pular um teste de ser feito