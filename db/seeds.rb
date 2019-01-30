# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create([
  {title: 'Programming'}
])

Test.create([
  {title: 'HTML', level: 1, category: 1}
  {title: 'Git', level: 1, category: 1}
  {title: 'Ruby', level: 3, category: 1}
])

Question.create([
  {body: 'Если вы хотите отобразить поле для ввода чисел в заданном диапазоне, используйте тип:', test: 1}
  {body: 'Для чего нужна команда git log?', test: 2}
  {body: 'Необходимо ли слово return для возврата метода значения', test: 3}
])

Answers.create([
  {body: "number", correct: true, question: 1}
  {body: "range", correct: false, question: 1}
  {body: "Просмотр веток", correct: false, question: 2}
  {body: "Просмотр коммитов", correct: true, question: 2}
  {body: "Нет", correct: true, question: 3}
  {body: "Да", correct: false, question: 3}
])

User.create([
  {name: Yana, admin: false, test: 3}
])
