require 'rails_helper'

describe ProductsController, type: :controller do
	before do
		@user = FactoryBot.build(:user)
		@admin = FactoryBot.build(:user, admin: true)
		@product = FactoryBot.create(:product)
	end

	describe 'GET #index' do
	end

	describe 'GET #show' do
		context 'when a user is logged in' do
			before do
				sign_in @user
			end

			it 'loads correct product details' do
				get :show, params: { id: @product.id }
				expect(response).to be_ok
				expect(assigns(:product)).to eq @product
			end
		end

	end


	describe 'POST #new' do
		before do
			sign_in @user
		end

		it 'posts correct new product' do
			post :new, params: { name: "10 x 20 Locker", description: "10x20 storage unit.", image_url: "/images/10x20.png", price: "130.00" }
			expect(response).to be_ok
		end
	end

	describe 'GET #edit' do
	end

	describe 'POST #create' do
	end

	describe 'PATCH #update' do
	end

	describe 'DELETE #destroy' do
	end

end