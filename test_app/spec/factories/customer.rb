FactoryBot.define do
    factory :customer, aliases: [:user] do

        transient do
            upcased false
            qtt_order 3
        end

        name { Faker::Name.name }
        email { Faker::Internet.email }
        # sequence(:email) do { |n| "meu_email-#{n}@email.com"}
        address { Faker::Address.street_address}

        gender ["M", "F"].sample

        factory :customer_vip do
            vip true
            days_to_pay 30
        end

        factory :customer_default do
            vip false
            days_to_pay 10
        end

        trait :with_orders do 
            after(:create) do |customer, evaluator|
                create_list(:order, evaluator.qtt_order, customer: customer)
            end
        end

        after(:create) do |customer, evaluator|
            customer.name.upcase! if evaluator.upcased
        end
    end
end