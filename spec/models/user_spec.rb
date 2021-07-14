require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create(name: 'test', username: 'usertest', email: 'test@test.com') }

  it 'has none to begin with' do
    expect(User.count).to eq 0
  end

  it 'has one after adding one' do
    User.create(name: 'test', username: 'usertest', email: 'test@test.com')
    expect(User.count).to eq 1
  end
end
