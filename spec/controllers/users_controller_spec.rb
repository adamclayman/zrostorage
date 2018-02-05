require 'rails_helper'

describe UsersController, type: :controller do
	let(:user) { User.create!(first_name: "Adam", last_name: "Clayman", email: "adam+10@clayman.org", password: "Password") }
	let(:user2) { User.create!(first_name: "Adam", last_name: "Clayman", email: "adam+11@clayman.org", password: "Password") }

	describe 'GET #show' do
		context 'when a user is logged in' do
			before do
				sign_in user
			end

			it 'loads correct user details' do
				get :show, params: { id: user.id }
				expect(response).to be_ok
				expect(assigns(:user)).to eq user
			end
		end

		context 'when a different user is logged in' do
			before do
				sign_in user2
			end

			it 'does not show user2 the show page of user' do
				get :show, params: { id: user.id }
				expect(response).to_not be_ok
				expect(assigns(:user)).to eq user
				expect(response).to redirect_to(root_path)
			end
		end

		context 'when a user is not logged in' do
			it 'redirects to login' do
				get :show, params: { id: user.id }
				expect(response).to redirect_to(new_user_session_path)
			end

		end
	end
end