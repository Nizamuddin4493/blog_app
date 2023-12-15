require 'rails_helper'

RSpec.describe 'Users controller testing', type: :request do
  describe 'GET /index users' do
    it 'should render the index page with a full list of users and render the index template' do
      get '/users'
      expect(response).to have_http_status(200)
      expect(response).to render_template('index')
      expect(response.body).to include('placeholder txt')
    end

    it 'renders the show page with info about a specific user and the corresponding template' do
      get '/users/2'
      expect(response).to have_http_status(200)
      expect(response).to render_template('show')
      expect(response.body).to include('info')
    end
  end
end
