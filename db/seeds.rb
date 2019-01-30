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
  { title: 'HTML', level: 1, category: categories.first },
  { title: 'Git', level: 1, category: categories.first },
  { title: 'Ruby', level: 3, category: categories.first }
])

questions = Question.create!([
  { body: 'Если вы хотите отобразить поле для ввода чисел в заданном диапазоне, используйте тип:', test: tests[0] },
  { body: 'Для чего нужна команда git log?', test: tests[1] },
  { body: 'Необходимо ли слово return для возврата метода значения', test: tests[2] }
])

Answer.create!([
  { body: "number", correct: true, question: questions[0] },
  { body: "range", correct: false, question: questions[0] },
  { body: "Просмотр веток", correct: false, question: questions[1] },
  { body: "Просмотр коммитов", correct: true, question: questions[1] },
  { body: "Нет", correct: true, question: questions[2] },
  { body: "Да", correct: false, question: questions[2] }
])

users = User.create!([
  { name: 'Yana', admin: false, email: 'yaninamancevich@mail.ru'},
  { name: 'Dima', admin: false, email: 'moiseenko@gmail.ru' }
])

results = Result.create!([
  { user_id: users[0].id, test_id: tests[2].id },
  { user_id: users[1].id, test_id: tests[1].id }
])
