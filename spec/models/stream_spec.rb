require 'rails_helper'

RSpec.describe Stream, :type => :model do

	it { should validate_presence_of(:name)}

	it { should belong_to(:user) }
  # pending "add some examples to (or delete) #{__FILE__}"
end
