require 'rails_helper'

describe UsersController, type: :controller do
	@user = FactoryBot.create(:user)
	@usertwo = FactoryBot.create(:user)
	@useradmin = FactoryBot.create(:user, :admin)

	describe 'GET #show' do
		context 'when a user is logged in' do
			before do
				sign_in @user
			end

			it 'loads correct user details' do
				get :show, params: { id: @user.id }
				expect(response).to be_ok
				expect(assigns(:user)).to eq @user
			end
		end

		context 'when a different user is logged in' do
			before do
				sign_in @usertwo
			end

			it 'does not show usertwo the show page of another' do
				get :show, params: { id: user.id }
				expect(response).to_not be_ok
				expect(assigns(:user)).to eq user
				expect(response).to redirect_to(root_path)
			end
		end

		context 'when a user is not logged in' do
			it 'redirects to login' do
				get :show, params: { id: @user.id }
				expect(response).to redirect_to(new_user_session_path)
			end

		end
	end
end