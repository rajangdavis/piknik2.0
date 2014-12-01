require 'rails_helper'

RSpec.describe User, :type => :model do

	it { should validate_presence_of(:username)}

    it { should validate_presence_of (:password)}

	it { should have_many(:streams) }


    #EXAMPLE
    # it "should create a list" do

    #  ## use HTTP ver 'post, call the 'create' method,
    #  #  pass a parameter named 'list, use Factory Girl to return a 
    #  #  hash of the attributes of an object, this will pass 'name'
    #  #  to create, which is the parameter it will expect
     
    #  post :destroy, id: "34534543frf4"

    #  ## test that the controller redirects to the correct path
    #  #  in this case we want to go back to where we list out all
    #  #  the lists 
     
    #  expect(response).to redirect_to(lists_path)
# end

  # pending "add some examples to (or delete) #{__FILE__}"
end
