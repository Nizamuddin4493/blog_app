require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index posts' do
    before(:each) do
      @user = User.new(name: 'Nizam', posts_counter: 3)
      @user.save
      get '/users/1/posts'
    end
    it 'checks the correct response status, template rendering and placeholder text' do
      expect(response).to have_http_status(200)
      expect(response).to render_template('index')
      expect(response.body).to include('Dummy')
    end
  end

  describe 'GET /show' do
    before(:each) do
      @user = User.new(name: 'Khan', posts_counter: 0)
      @post = Post.new(title: 'My Rails Journey', text: 'Description', comments_counter: 2, likes_counter: 5,
                       author_id: 1)
      @user.save
      @post.save
    end

    it 'shows the specific of one post' do
      get '/users/1/posts/1'
      expect(response).to have_http_status(200)
      expect(response).to render_template('show')
      expect(response.body).to include('posts controller')
    end
  end
end
