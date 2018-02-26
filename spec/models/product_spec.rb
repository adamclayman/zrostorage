require 'rails_helper'

describe Product do
	let(:product) { Product.create!(name: "race bike", description: "a race bike description", price: 55.00)}
	let(:user) {User.create!(email: "adam+7@clayman.org", password: "Password")}
	before do
		product.comments.create!(rating: 1, user: user, body: "Awful bike!")
		product.comments.create!(rating: 3, user: user, body: "Ok bike!")
		product.comments.create!(rating: 5, user: user, body: "Great bike!")
	end

	it "returns the average rating of all comments" do
		expect(product.average_rating).to eq 3 
	end

	it "returns the highest rated comment" do
		expect(product.highest_rating_comment.rating).to eq 5 
	end

	it "returns the lowest rated comment" do
		expect(product.lowest_rating_comment.rating).to eq 1 
	end

	it "shows that a product without a name is invalid" do
		expect(Product.new(description: "Nice bike")).not_to be_valid
	end
end