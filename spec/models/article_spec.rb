require 'rails_helper'

RSpec.describe Article, type: :model do
  let(:user) { User.create(name: 'test', username: 'usertest', email: 'test@test.com') }

  it 'has none articles to begin with' do
    expect(Article.count).to eq 0
  end

  it 'has one article after adding one' do
    Category.create!(name: 'Sports')
    Article.create!(author_id: user.id, title: 'usertest', text: 'test@test.com', category_id: Category.first.id)
    expect(Article.count).to eq 1
  end
end
