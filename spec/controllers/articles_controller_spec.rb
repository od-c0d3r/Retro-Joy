require "rails_helper"
include SessionsHelper

RSpec.describe ArticlesController, :type => :controller do
    let(:user) { User.create(name:'test',username:'usertest',email:'test@test.com') } 
    render_views
    
    describe "GET new" do
        it "has a 200 status code" do
            log_in(user)
            get :new
            expect(response.status).to eq(200)
        end
        it "has a new article related heading" do
            log_in(user)
            get :new
            expect(response.body).to match /Post/
        end
        it "renders the new article template" do
            log_in(user)
            get :new
            expect(response).to render_template("new")
        end
    end
end
