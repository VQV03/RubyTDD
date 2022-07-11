FactoryBot.define do
  factory :order do
    sequence(:description) { |n| "Pedido numero - #{n}" }
    # association :customer, factory: :customer
    #Ambas as linhas 4 e 6 significam a msm coisa
    customer
  end
end
