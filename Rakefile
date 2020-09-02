# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks


desc "Find or create authors for books, and associate the books to them."
task :add_author_id do
  Book.all.each do |b|
    a = Author.find_or_create_by!(name: b.author)
    b.update!(author_id: a.id)
  end
end
