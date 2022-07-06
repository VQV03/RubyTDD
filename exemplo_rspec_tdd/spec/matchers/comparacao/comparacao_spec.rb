describe 'Matchers de Comparaçao' do
    it '>' do
      expect(5).to be > 1
    end
  
    it '>=' do
      expect(5).to be >= 2
      expect(5).to be >= 5
    end
  
    it '<' do
      expect(5).to be < 10
    end
  
    it '<=' do
      expect(5).to be <= 12
      expect(5).to be <= 5
    end
  
    it 'be_between inclusive' do
      expect(5).to be_between(2,7).inclusive
      expect(2).to be_between(2,7).inclusive
      expect(7).to be_between(2,7).inclusive
    end
  
    # it 'be_between inclusive / Falhas agregadas', aggregate_failures: true do
    #   expect(5).to be_between(2,7).inclusive
    #   expect(1).to be_between(2,7).inclusive
    #   expect(8).to be_between(2,7).inclusive
    # end

    # it 'be_between inclusive / Falhas agregadas' do
    #   expect(5).to be_between(2,7).inclusive
    #   expect(1).to be_between(2,7).inclusive
    #   expect(8).to be_between(2,7).inclusive
    # end
  
    it 'be_between exclusive' do
      expect(5).to be_between(2,7).exclusive
      expect(3).to be_between(2,7).exclusive
      expect(6).to be_between(2,7).exclusive
    end
  
    it 'match' do
      expect("gersin@gmail.com.br").to match(/..@../)
    end
  
    it 'start_with' do
      expect("gerson arantes santos").to start_with("gerson")
      expect([1,2,3]).to start_with(1)
    end
  
    it 'end_with' do
      expect("piririco pao duro").to end_with("duro")
      expect([1,2,3]).to end_with(3)
    end
  end