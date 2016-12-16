FactoryGirl.define do
	factory :user do
		username "Barvis"
		email "barvis@test.com"
		password "123456"
	end

	factory :user2, class: "User" do
		username "Mavis"
		email "mavis@test.com"
		password "123456"
	end

	factory :user3, class: "User" do
		username "Snarvis"
		email "snarvis@test.com"
		password "123456"
	end

	factory :image do
		# user :user
		file File.open(File.join(Rails.root, '/spec/fixtures/files/steve.jpg'))
	end
end
