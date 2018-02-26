FactoryBot.define do
	factory :product do
		sequence(:name) { |n| "Product #{n} name" }
		sequence(:description) { |n| "Product #{n} long description"} 
		sequence(:image_url) { |n| "http://images.google.com/#{n}" }
		sequence(:price) { |n| n}
	end
end