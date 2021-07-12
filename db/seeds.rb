user = User.create!(name:  "Omar R.",
            username: 'omarrashad'
            email: "example@railstutorial.org")

Category.create(name:'Sport')
Category.create(name:'Business')
Category.create(name:'Entertainment')
Category.create(name:'Fashion')

categories = Category.all

10.times do
    title = Faker::Lorem.sentence(word_count: 5)
    content = Faker::Lorem.paragraph(sentence_count: 50)
    image = Faker::Placeholdit.image(size: '400x400', format: 'jpg')
    categories.each { |cat| user.articles.create!(title:title, text:content, image:image, category_id: cat.id) }
end
