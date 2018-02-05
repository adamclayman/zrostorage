require 'rails_helper'

describe Product do
	let(:product) { Product.create!(name: "race bike")}
	let(:user) {User.create!(email: "adam+7@clayman.org", password: "Password")}

	before do
		product.comments.create!(rating: 1, user: user, body: "Awful bike!")
		product.comments.create!(rating: 3, user: user, body: "Ok bike!")
		product.comments.create!(rating: 5, user: user, body: "Great bike!")
	end
end