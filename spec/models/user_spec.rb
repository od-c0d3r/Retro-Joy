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

  describe User do
    it 'should have many articles' do
      t = User.reflect_on_association(:articles)
      expect(t.macro).to eq(:has_many)
    end

    it 'should have many articles' do
      t = User.reflect_on_association(:votes)
      expect(t.macro).to eq(:has_many)
    end

    it 'validates presence' do
      record = User.new(name: 'test', username: 'usertest')
      record.email = '' # invalid state
      record.validate
      expect(record.errors[:email]).to include("can't be blank") # check for presence of error

      record.email = 'foo@bar.com' # valid state
      record.validate
      expect(record.errors[:email]).to_not include("can't be blank") # check for absence of error
    end
  end
end
