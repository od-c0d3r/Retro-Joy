require "rails_helper"
include SessionsHelper

RSpec.describe VotesController, :type => :controller do
    render_views
    let(:user)     { User.create!(name:'test',username:'usertest',email:'test@test.com') }
    let(:category) { Category.create!(name:"Test Cat") } 
    let(:article)  { Article.create!(author_id:user.id, title:"Testtitle",text:'text',category_id:category.id) } 


    describe "GET new" do
        it "has a 200 status code" do
            log_in(user)
            post :create, params: { user_id: user.id, article_id:article.id }
            expect(response.status).to eq(204)
        end
    end
end
