# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create({ name: "User", email: "user_email@test.guru", password: "123456" })
admin1 = Admin.create({ name: "Admin", email: "admin_email@test.guru", password: "123456", first_name: "Ny", last_name: "Admin" })

category1 = Category.create({ title: 'Python' })
category2 = Category.create({ title: "Ruby on Rails" })

test1 = Test.create({ title: "Basic python", level: 1, category_id: category1.id })
test2 = Test.create({ title: "Basic ruby and rails", level: 1, category_id: category2.id }) 

question1 = Question.create({ body: "Под влиянием какого языка был создан Ruby?", test_id: test2.id })
question2 = Question.create({ body: "Как называется самый популярный фреймворк на Ruby?", test_id: test2.id })
question3 = Question.create({ body: "Как называется стандартная среда  разработки в python? ", test_id: test1.id })

answer11 = Answer.create({ body: "Под влиянием Perl", correct: true, question_id: question1.id })
answer12 = Answer.create({ body: "Под влиянием C++", correct: false, question_id: question1.id })
answer13 = Answer.create({ body: "Под влиянием Haslell", correct: false, question_id: question1.id })

answer21 = Answer.create({ body: "Sinatra", correct: false, question_id: question2.id })
answer22 = Answer.create({ body: "Hanami", correct: false, question_id: question2.id })
answer23 = Answer.create({ body: "Ruby on Rails", correct: true, question_id: question2.id })

answer31 = Answer.create({ body: "Блокнот", correct: false, question_id: question3.id })
answer32 = Answer.create({ body: "IDLE", correct: true, question_id: question3.id })
answer33 = Answer.create({ body: "IDOL", correct: false, question_id: question3.id })
