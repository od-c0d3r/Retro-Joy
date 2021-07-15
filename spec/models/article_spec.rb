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

  describe Article do
    it "should belongs to an author" do
      t = Article.reflect_on_association(:author)
      expect(t.macro).to eq(:belongs_to)
    end

    it "should have many votes" do
      t = Article.reflect_on_association(:votes)
      expect(t.macro).to eq(:has_many)
    end

    it "should belongs to a category" do
      t = Article.reflect_on_association(:category)
      expect(t.macro).to eq(:belongs_to)
    end

    it 'validates presence of title' do
      Category.create!(name: 'Sports')
      record = Article.new(author_id: user.id, title: 'usertest', text: 'test@test.com', category_id: Category.first.id)
      record.title = ''
      record.validate
      expect(record.errors[:title]).to include("can't be blank") 
      record.title = 'Title exists'
      record.validate
      expect(record.errors[:title]).to_not include("can't be blank") 
    end
  end
end
