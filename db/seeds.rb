# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
admin=User.new(name: 'David French', email: 'brookviewonellc@gmail.com', password: 'temp1trial2', password_confirmation: 'temp1trial2' )
admin.toggle!(:admin)
admin.save!

tenant=User.new(name: 'Joe Tenant', email: 'joe.tenant@email.com', password: 'hellotenant', password_confirmation: 'hellotenant')
tenant.save!