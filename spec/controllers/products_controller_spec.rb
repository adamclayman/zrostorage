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



	describe 'GET #edit' do
		context 'when an admin edits a product' do
			before do
				sign_in admin
				it 'renders the edit template' do
					get :edit, params: { id: @product.id }
					expect(assigns(:product)).to eq @product
					expect(response).to redirect_to('edit')
				end
			end
		end

		context 'when a non-admin user edits a product' do
			before do
				sign_in user
				it 'redirects her/him to root path' do
					get :edit, params: { id: @product.id }
					expect(assigns(:product)).to eq @product
					expect(response).to redirect_to(root_path)
				end
			end
		end

		context 'when anyone not signed in edits a product' do
			it 'redirects her/him to root path' do
				get :edit, params: { id: @product.id }
				expect(assigns(:product)).to eq @product
				expect(response).to redirect_to(+ '/login')
			end
		end
	end

	describe 'POST #create' do
		context 'when an admin submits a new product' do		
			before do
				sign_in admin
				it 'creates a new product if valid' do
					post :create, params: { product: attributes_for(product) }
					expect(status).to be_ok
				end

				it 'rejects a new product if invalid' do
					post :create, params: { product: attributes_for(product) }
					expect(status).not_to be_ok
				end
			end
		end
	end


	describe 'PUT #update' do
		context 'when an admin submits an update to a product' do
			before do
				sign_in admin
				it 'updates product if valid' do
					put :update, params: { product: product }
					expect(status).to be_ok
					expect(response).to redirect_to('show')
				end

				it 'does not update product if invalid' do
					put :update, params: { product: invalid_product }
					expect(response).not_to be_ok
					expect(response).to redirect_to('edit')
				end
			end
		end
	end

	context 'DELETE #destroy' do
		before do
			let(:product_to_delete) { FactoryBot.create(:product) }

			it 'deletes product by id' do
				delete :destroy, params: { product: product_to_delete }
				expect(notice).to eq 'Product was successfully destroyed.'
			end
		end
	end
end