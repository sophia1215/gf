# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

create_faqs = for i in 1..20 do
                  Faq.create!([
                  	question: "Question No.#{i}",
                  	answer: "這是用種子建立的第 #{i} 個 Q&A"
                  ])
                end