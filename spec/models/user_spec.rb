require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  before(:all) do 
		User.create(name: "first user", email: "text@exmaple.com")
	end

	describe 'uniqueness of email' do 
		it 'should not allow text@exmaple.com to signup again' do 
			@user = User.new(name: "first user", email: "text@exmaple.com")
			@user.save
			expect(@user.errors[:email].first).to eq "has already been taken"
		end
	end

end
