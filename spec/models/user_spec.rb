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
end
