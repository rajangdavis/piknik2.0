require 'rails_helper'

RSpec.describe User, :type => :model do

	it { should validate_presence_of(:username)}

	it { should have_many(:streams) }

	it { should have_many(:images) }


  # pending "add some examples to (or delete) #{__FILE__}"
end
