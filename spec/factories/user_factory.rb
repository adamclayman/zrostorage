FactoryBot.define do
	factory :user do
		email 'adam+12@clayman.org'
		password 'Password'
		first_name 'Adam'
		last_name 'Clayman'
		admin false
	end

	factory :user2 do
		email 'adam+11@clayman.org'
		passsword 'Password'
		first_name 'Adam'
		last_name 'Clayman'
		admin false
	end

	factory :useradmin do
		email 'adam+13@clayman.org'
		password 'Password'
		first_name 'Adam'
		last_name 'Clayman'
	end
end