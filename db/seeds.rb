# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
city_list = ['Boston', 'Boulder', 'Chicago', 'Denver', 'Los Angeles', 'New York', 'San Francisco']
language_list = ['Go', 'JavaScript', 'Python', 'Ruby', 'Scala', 'Other']

city_list.each do |city_name|
  city = City.create!(name: city_name)
  language_list.each do |language|
    city.languages.create!(name: language)
  end
end
