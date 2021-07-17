require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  render_views

  describe 'GET new' do
    it 'has a 200 status code' do
      get :new
      expect(response.status).to eq(200)
    end
    it 'has a login user related heading' do
      get :new
      expect(response.body).to match /Log in/
    end
    it 'renders the login user template' do
      get :new
      expect(response).to render_template('new')
    end
  end
end
