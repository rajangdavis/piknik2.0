require 'rails_helper'

RSpec.describe Image, :type => :model do
	it { should belong_to :user}

	it { should belong_to :stream}
  # pending "add some examples to (or delete) #{__FILE__}"
end
