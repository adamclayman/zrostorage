require 'rails_helper'

describe Comment, type: :model do
	let(:product) { Product.create!(name: "race bike", description: "a race bike description", price: 55.00)}
	let(:user) {User.create!(email: "adam+7@clayman.org", password: "Password")}
	before do
		product.comments.create!(rating: 1, user: user, body: "Awful bike!")
		product.comments.create!(rating: 3, user: user, body: "Ok bike!")
		product.comments.create!(rating: 5, user: user, body: "Great bike!")
	end

	it "should not validate a comment without a user_id" do
		expect(product.comments.build(rating: 1, body: "Awful bike!")).not_to be_valid
	end

	it "should not validate a comment without a body" do
		expect(product.comments.build(rating: 1, user: user)).not_to be_valid
	end

	it "should not validate a comment without a rating" do
		expect(product.comments.build(user: user, body: "Awful bike!")).not_to be_valid
	end

end