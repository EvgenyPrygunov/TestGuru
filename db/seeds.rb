# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Test.create([
                { title: 'Ruby on Rails', level: 1 },
                { title: 'NodeJS', level: 2 },
                { title: 'Python', level: 3 }
            ])

Category.create([
                    { title: 'Frontend' },
                    { title: 'Backend' },
                    { title: 'Machine Learning' }
                ])

Question.create([
                    { body: 'Зачем нужен Ruby?', test_id: 1 },
                    { body: 'Зачем нужен NodeJS?', test_id: 2 },
                    { body: 'Зачем нужен Python?', test_id: 3 }
                ])

Answer.create([
                  { body: 'Правильный ответ', correct: true, test_id: 1 },
                  { body: 'Неправильный ответ 1', test_id: 1 },
                  { body: 'Неправильный ответ 2', test_id: 1 },
                  { body: 'Правильный ответ', correct: true, test_id: 2 },
                  { body: 'Неправильный ответ 1', test_id: 2 },
                  { body: 'Неправильный ответ 2', test_id: 2 },
                  { body: 'Правильный ответ', correct: true, test_id: 3},
                  { body: 'Неправильный ответ 1', test_id: 3 },
                  { body: 'Неправильный ответ 2', test_id: 3 }
              ])

User.create([
                { first_name: 'Юрий', last_name: 'Петров' }
            ])

UserTest.create([
                    { user_id: 1, test_id: 1 },
                    { user_id: 1, test_id: 2 },
                    { user_id: 1, test_id: 3 }
                ])
