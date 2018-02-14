FactoryBot.define do
	factory :comment do
		sequence(:user_id) { |n| n}
		sequence(:body) { |n| "Here's the body of comment #{n}"}
		sequence(:rating) { Random.new(4) + 1 }
	end
end	