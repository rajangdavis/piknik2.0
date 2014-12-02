require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
  before do
    @user=User.create!(username:"example", password:"secret", password_confirmation:"secret")
  end
  let :valid_attributes do
    {
      username: "example",
      password: "secret",
      password_confirmation: "secret"
    }
  end

  describe "POST create" do
    
    it "should save user if created" do
      
      post :create, {:user =>  valid_attributes}
      expect(response).to have_http_status(:success)
    end


    it "should redirect to user show page" do
      post :create, {:user => valid_attributes}
      expect(response).to redirect_to(user_path(assigns(:user)))

    end

   
end






  # describe "GET update" do
  #   it "returns http success" do
  #     get :update
  #     expect(response).to be_success
  #   end
  # end

  

  # describe "GET edit" do
  #   it "returns http success" do
  #     get :edit
  #     expect(response).to be_success
  #   end
  # end

  describe "GET show" do
    before do
      @user = User.create!
      valid_attributes
      get :show, :id => @user.id
    it "returns http success" do
     
      response.should be_success
    end
  end

end
