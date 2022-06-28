5.times do |n|
  Task.create!(
    name: "test#{n}",
    content: "test#{n}の内容です。"
  )
end
