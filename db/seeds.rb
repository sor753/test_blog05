Administrator.create!(
  name: "admin",
  password: "password"
)

100.times do |n|
  Blog.create!(
    title: "test#{n}",
    author: "admin",
    image: "test#{n}"
  )
end