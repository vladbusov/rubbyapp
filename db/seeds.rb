# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
seed_file = Rails.root.join('db', 'seeds', 'seeds.yml')
config = HashWithIndifferentAccess.new(YAML::load_file(seed_file))
# APP_CONFIG = HashWithIndifferentAccess.new(YAML.load(File.read(File.expand_path('../app.yml', __FILE__))))
config[:projects].each do |i|
	make_todos = i[:todos]
	i.delete("todos")
	proj = Project.create!(i)
	make_todos.each do |j|
		j["project_id"] = proj[:id]
	end
	todos = Todo.create!(make_todos)
end

puts "Таблица успешно заполнена!"

#Todo.create!(config[:todos])
#Project.create!(config[:projects])