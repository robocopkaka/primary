# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

50.times do
	school_name = Faker::University.name
	school_address = ["egbeda", "ikeja", "yaba", "lekki", "epe"].sample
	school_state = "Lagos"
	school_fees = [100000,2000000,3000000,50000,10000,5000,75000,30000].sample
	school_reg_fees = [50000,10000,200000].sample
	School.create!(name: school_name, address: school_address, fees: school_fees, reg_fees: school_reg_fees, state: school_state)
end