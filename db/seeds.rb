# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb

# Создаём  пользователя
admin = User.create!(
  email: "admin@example.com",
  password: "admin123"
)

# Назначаем роль после создания
admin.update!(role: "admin")

user = User.create!(
  email: "demo@example.com",
  password: "password"
)

user1 = User.create!(
  email: "example@gmail.com",
  password: "password1"
)

# Пара постов
post1 = Post.create!(
  title: "Первый пост"
  content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
  user_id: 1
)

post2 = Post.create!(
  title: "Второй пост",
  content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
  user_id: 1
)

# Комментарии
Comment.create!(content: "Отличный пост!", user_id: 2, post_id: 1)
Comment.create!(content: "Хороший пост", user_id: 3, post_id: 2)
Comment.create!(content: "А мне второй больше зашёл", user_id: 2, post_id: 2)
