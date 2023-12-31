require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:post) do
    Post.new(author_id: 6, title: 'test', text: 'This is for my test', likes_counter: 0, comments_counter: 0)
  end

  before { post.save }

  it 'Title should not be blank' do
    post.title = nil
    expect(post).to_not be_valid
  end

  it 'comments counter should be integer' do
    post.comments_counter = -1
    expect(post).to_not be_valid
  end

  it 'like counter should be integer or greate than zero' do
    post.likes_counter = -4
    expect(post).to_not be_valid
  end

  it 'title length should not be greate than 250 chars' do
    expect(post.title.length).to be <= 250
  end
end
