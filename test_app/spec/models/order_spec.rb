require 'rails_helper'

RSpec.describe Order, type: :model do
  it "Have a order" do
    customer = create(:customer)
    order = create(:order)
    expect(order.customer).to be_kind_of(Customer) 
  end

  it "Have 3 orders" do
    orders = create_list(:order, 3)
    expect(orders.count).to eq(3) 
  end

  it "has many" do 
    customer = create(:customer, :with_orders)
    puts customer.inspect
    puts customer.orders.inspect
    expect(customer.orders.count).to eq(3)
  end
end
