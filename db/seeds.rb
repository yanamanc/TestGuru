# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = Category.create!([
  { title: 'Программирование' },
  { title: 'Основы алгоритмизации' }
])

tests = Test.create!([
  { title: 'HTML', level: 1, category_id: categories.first.id },
  { title: 'Git', level: 1, category_id: categories.first.id },
  { title: 'Ruby', level: 3, category_id: categories.first.id }
])

questions = Question.create!([
  { body: 'Если вы хотите отобразить поле для ввода чисел в заданном диапазоне, используйте тип:', test_id: tests[0].id },
  { body: 'Для чего нужна команда git log?', test_id: tests[1].id },
  { body: 'Необходимо ли слово return для возврата метода значения', test_id: tests[2].id }
])

Answer.create!([
  { body: "number", correct: true, question_id: questions[0].id },
  { body: "range", correct: false, question_id: questions[0].id },
  { body: "Просмотр веток", correct: false, question_id: questions[1].id },
  { body: "Просмотр коммитов", correct: true, question_id: questions[1].id },
  { body: "Нет", correct: true, question_id: questions[2].id },
  { body: "Да", correct: false, question_id: questions[2].id }
])

users = User.create!([
  { name: 'Yana', admin: false},
  { name: 'Dima', admin: false }
])

results = Result.create!([
  { user_id: users[0].id, test_id: tests[2].id },
  { user_id: users[1].id, test_id: tests[1].id }
])

Author.create!([
  { user_id: users[1].id, test_id: tests[2].id }
])
