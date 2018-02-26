FactoryBot.define do
	factory :comment do
		sequence(:user_id) { |n| n}
		sequence(:body) { |n| "Here's the body of comment #{n}"}
		sequence(:rating) { rand(4) + 1 }
		product
	end
end	