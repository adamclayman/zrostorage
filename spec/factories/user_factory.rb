FactoryBot.define do
	factory :user do
		sequence(:email) {|n| "user#{n}@example.com" }
		password 'Password'
		first_name 'Adam'
		last_name 'Clayman'

		trait :admin do
			admin true
		end
	end
end