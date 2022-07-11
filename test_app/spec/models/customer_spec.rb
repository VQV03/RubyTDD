require 'rails_helper'

RSpec.describe Customer, type: :model do

  it "#full_name" do
      customer = create(:customer, name: "Vitor Queiroz")

      expect(customer.full_name).to eq("Sr./Sra. Vitor Queiroz")
    end

  it "#customer_vip - Heranca" do
    customer = create(:customer_vip)

    expect(customer.vip).to eq(true)
  end

  it "#customer_default - Heranca" do
    customer = create(:customer_default)

    expect(customer.vip).to eq(false)
  end

  it "#full_name" do
    customer = create(:user) # e a mesma coisa que create(:customer)

    expect(customer.full_name).to start_with("Sr.") 
  end

  it "Usando o attributes_for" do
    attrs = attributes_for(:customer)
    #attrs2 = attributes_for(:customer_vip)
    #attrs3 = attributes_for(:customer_default)
    #puts attrs
    #puts attrs2
    #puts attrs3

    customer = Customer.create(attrs)
    expect(customer.full_name).to start_with("Sr.") 
  end

  it "Male customer" do
    customer = create(:customer_vip, gender: "M")
    expect(customer.gender).to eq("M")
    expect(customer.vip).to eq(true) 
  end

  it "Female customer" do
    customer = create(:customer_vip, gender: "F")
    expect(customer.gender).to eq("F")
    expect(customer.vip).to eq(true) 
  end

  it "Atributo Transitorio" do
    customer = create(:customer_default, upcased: true)
    expect(customer.name.upcase).to eq(customer.name) 
  end

  it "travel_to" do
    travel_to Time.zone.local(2004, 11, 24, 01, 04, 44) do
      @customer = create(:customer_vip)
    end

    puts @customer.created_at
    expect(@customer.created_at).to be < Time.now
  end

  it { expect{ create(:customer) }.to change{Customer.all.size}.by(1) } 

end
