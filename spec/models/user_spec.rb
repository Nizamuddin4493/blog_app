require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', posts_counter: 0) }

  before { user.save }

  it 'Name should not be blank' do
    user.name = nil
    expect(user).to_not be_valid
  end

  it 'post_counter must be an integer greater than or equal' do
    user.posts_counter = -1
    expect(user).to_not be_valid
  end

  it 'user should be valid' do
    expect(user).to be_valid
  end

  describe '#three_most_recent_posts' do
    let(:user) { create(:user) }
    let!(:old_post) { create(:post, author: user, created_at: 1.year.ago, text: 'Sample content') }

    let!(:recent_posts) { create_list(:post, 3, author: user, created_at: Time.now) }

    it 'returns the three most recent posts' do
      expected_posts = recent_posts.sort_by(&:created_at).reverse.map(&:to_json)
      actual_posts = user.three_most_recent_posts.to_a.sort_by(&:created_at).reverse.map(&:to_json)

      expect(actual_posts).to eq(expected_posts)
    end
  end
end
