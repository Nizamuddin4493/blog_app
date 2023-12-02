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

  describe '#five_most_recent_comments' do
    it 'returns the five most recent comments for the post' do
      post = create(:post, author: user)
      create_list(:comment, 5, post:, created_at: 1.month.ago)
      recent_comments = create_list(:comment, 5, post:)

      expected_comment_ids = recent_comments.pluck(:id).sort.reverse
      actual_comment_ids = post.five_most_recent_comments.pluck(:id).sort.reverse

      expect(actual_comment_ids).to eq(expected_comment_ids)
    end
  end

  describe '#update_post_counter' do
    it 'updates the author\'s post_counter' do
      create(:post, author: user)
      expect { create(:post, author: user) }.to change { user.reload.post_counter }.by(1)
    end
  end
end
