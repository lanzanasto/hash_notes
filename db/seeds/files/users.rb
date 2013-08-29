# encoding: UTF-8
puts "Seeding users"

User.create(:email                  => 'n.lanzanasto@gmail.com',
            :password               => 'lanzanasto',
            :password_confirmation  => 'lanzanasto'
            ).save!

User.create(:email                  => 'max.mustermann@gmail.com',
            :password               => 'mustermann',
            :password_confirmation  => 'mustermann'
            ).save!
