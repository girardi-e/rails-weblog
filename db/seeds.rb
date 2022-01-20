puts 'Cleaning database...'
Article.destroy_all

puts 'Creating Articles ...'

terminal = {
  title: 'The ultimate terminal',
  body: 'A step by step guide to setup Hyper with fish and oh-my-posh',
  status: 'public'
}

argular = {
  title: 'Angular Components',
  body: 'Proven concepts on how to implement and showcase your UI components',
  status: 'public'
}

[terminal, angular].each do |attributes|
  article = Article.create!(attributes)
  puts "Created #{article.title}"
end

puts 'Finished!'
