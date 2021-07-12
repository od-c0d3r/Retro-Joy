require "rails_helper"
include SessionsHelper

RSpec.describe CategoriesController, :type => :controller do
    render_views
    let(:category) { Category.create(name:"Test Cat") } 
    let(:user)     { User.create(name:'test',username:'usertest',email:'test@test.com') }

    describe "GET new" do
        it "has a 200 status code" do
            log_in(user)
            get :show, params: { id: category.id }
            expect(response.status).to eq(200)
        end
        it "has a category show page related heading" do
            log_in(user)
            get :show, params: { id: category.id }
            expect(response.body).to match /<section class="d-flex/
        end
        it "renders the category show template" do
            log_in(user)
            get :show, params: { id: category.id }
            expect(response).to render_template("show")
        end
    end
end
