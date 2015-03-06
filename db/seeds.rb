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

tenant=User.new(name: 'Jason French', email: 'jason.french@fake.email.com', password: 'hellotenant', password_confirmation: 'hellotenant')
tenant.save!

tenant2=User.new(name: 'Shawn Smith', email: 'shawnsmith@abc.com', password: 'shawnsmith22', password_confirmation: 'shawnsmith22')
tenant2.save!

tenant3=User.new(name: 'Gail Dedominces', email: 'gaild@abc.com', password: 'galed123', password_confirmation: 'galed123')
tenant3.save!

tenant4=User.new(name: 'Kristi Drischler', email: 'kristi1891@abc.com', password: 'kristi1891', password_confirmation: 'kristi1891')
tenant4.save!

tenant5=User.new(name: 'Felix Keppler', email: 'felixkeppler@aabc.com', password: 'felixk6013', password_confirmation: 'felixk6013')
tenant5.save!

tenant6=User.new(name: 'Ryan Clarke', email: 'ryan.clarke@aabc.com', password: 'ryanclarke444', password_confirmation: 'ryanclarke444')
tenant6.save!

tenant7=User.new(name: 'Simon Madsen', email: 'spmad555@aabc.com', password: 'spmad555', password_confirmation: 'spmad555')
tenant7.save!

tenant8=User.new(name: 'Chris Marsella', email: 'chrismarsella@aabc.com', password: 'chris1305', password_confirmation: 'chris1305')
tenant8.save!