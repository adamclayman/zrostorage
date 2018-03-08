FactoryBot.define do
	factory :comment do
		user
		sequence(:body) { |n| "Here's the body of comment #{n}"}
		sequence(:rating) { rand(4) + 1 }
		product
	end
end	