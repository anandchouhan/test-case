require 'rails_helper'

module Api::V1
  RSpec.describe UsersController, type: :controller do

    let(:valid_attributes) do
      {
        'first_name' => 'test',
        'last_name' => 'user',
        'email' => 'test@test.com',
        'age' => 40
      }
    end

    describe "GET index" do
      it "returns a 200" do
        # create the user using factory
        FactoryBot.create(:user, first_name: 'first', last_name: 'user', email: 'first@mail.com', age: 40)
        FactoryBot.create(:user, first_name: 'second', last_name: 'user', email: 'second@mail.com', age: 30)
        get :index

        expect(response).to have_http_status(:success)
        expect(JSON.parse(response.body).size).to eq(2)
      end
    end

    describe "GET new" do
      it "returns a 200" do
        get :new
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET show" do
      it "returns" do
        # second way to create the user
        user = User.create!(first_name: 'first', last_name: 'user', email: 'first@mail.com', age: 40)
        get :show, params: {id: user.id }

        expect(response).to have_http_status(:success)
      end
    end

    describe "POST create" do
      # it "returns a 200" do
      #   get :create

      #   user = FactoryBot.create(:user, name: Faker::Name.name, email: Faker::Email.email, age: Faker::Age.age)

      #   post :create, user: 
      #     { user_id: user.id,  format: 'json' }
      #   expect(response).to have_http_status(:success)
      # end

      it 'creates a new Post' do
        expect do
          user = User.new(valid_attributes)
          user.save
          {user: valid_attributes, format: 'json' }
        end.to change(User, :count).by(1)
      end

      it 'render to the created post' do
        {user: valid_attributes, format: 'json' }
        expect(response).to be_successful
      end
    end

    describe "DESTROY delete" do
      it "delete user" do
        user = FactoryBot.create(:user, first_name: 'first', last_name: 'user', email: 'first@mail.com', age: 40)

        expect do
          delete :destroy, params: {id: user.id }
        end.to change(User, :count).by(-1)
      end
    end

    describe "PUT update" do
      it "returns a 200" do
        user = FactoryBot.create(:user, first_name: 'first', last_name: 'user', email: 'first@mail.com', age: 40)
        put :update, params: {id: user.id, user: {first_name: 'first', last_name: 'user', email: 'first@mail.com', age: 40}}

        expect(response).to have_http_status(:success)
      end
    end

    describe "GET edit" do
      it "returns a 200" do
        # second way to create the user
        user = User.create!(first_name: 'first', last_name: 'user', email: 'first@mail.com', age: 40)
        get :show, params: {id: user.id }

        expect(response).to have_http_status(:success)
      end
    end
  end
end