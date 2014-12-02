require 'rails_helper'

describe Stream do
	it "has a valid factory" do 
		expect(FactoryGirl.create(:stream)).to be_valid
	end

	it "is invalid without a name" do
        expect(FactoryGirl.build(:stream, name: nil)).to be_invalid
    end

    it "has a foreign key for user_id " do
        expect(FactoryGirl.build(:stream, user_id: nil)).to be_invalid
    end
    
end
#    it { should belong_to(:user) } 

















# RSpec.describe Stream, :type => :model do

# 	it { should validate_presence_of(:name)}



  # pending "add some examples to (or delete) #{__FILE__}"
#end
