require "rails_helper"

RSpec.describe UsersController, :type => :controller do
    render_views
    
    describe "GET new" do
        it "has a 200 status code" do
            get :new
            expect(response.status).to eq(200)
        end
        it "has a new user related heading" do
            get :new
            expect(response.body).to match /Create my account/
        end
        it "renders the new user template" do
            get :new
            expect(response).to render_template("new")
        end
    end
end
