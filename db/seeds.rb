# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Test.create!([
                { title: 'Ruby on Rails', level: 1, author_id: users[0].id },
                { title: 'NodeJS', level: 2, author_id: users[0].id },
                { title: 'Python', level: 3, author_id: users[0].id }
            ])

Category.create!([
                    { title: 'Frontend' },
                    { title: 'Backend' },
                    { title: 'Machine Learning' }
                ])

Question.create!([
                    { body: 'Зачем нужен Ruby?', test_id: tests[0].id },
                    { body: 'Зачем нужен NodeJS?', test_id: tests[1].id },
                    { body: 'Зачем нужен Python?', test_id: tests[2].id }
                ])

Answer.create!([
                  { body: 'Правильный ответ', correct: true, test_id: tests[0].id },
                  { body: 'Неправильный ответ 1', test_id: tests[0].id },
                  { body: 'Неправильный ответ 2', test_id: tests[0].id },
                  { body: 'Правильный ответ', correct: true, test_id: tests[1].id },
                  { body: 'Неправильный ответ 1', test_id: tests[1].id },
                  { body: 'Неправильный ответ 2', test_id: tests[1].id },
                  { body: 'Правильный ответ', correct: true, test_id: tests[2].id },
                  { body: 'Неправильный ответ 1', test_id: tests[2].id },
                  { body: 'Неправильный ответ 2', test_id: tests[2].id }
              ])

User.create!([
                { first_name: 'Юрий', last_name: 'Петров' }
            ])

TestsUser.create!([
                    { user_id: users[0].id, test_id: tests[0].id },
                    { user_id: users[0].id, test_id: tests[1].id },
                    { user_id: users[0].id, test_id: tests[2].id }
                ])
