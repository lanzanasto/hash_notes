# encoding: UTF-8
puts "Seeding #tags"

HashTag.create(:tag   => "#receipt",
               :count => 2,
               :user  => User.find_by_email("n.lanzanasto@gmail.com")
)

HashTag.create(:tag   => "#dough",
               :count => 1,
               :user  => User.find_by_email("n.lanzanasto@gmail.com")
)

HashTag.create(:tag   => "#dessert",
               :count => 1,
               :user  => User.find_by_email("n.lanzanasto@gmail.com")
)

HashTag.create(:tag   => "#ruby",
               :count => 1,
               :user  => User.find_by_email("n.lanzanasto@gmail.com")
)

HashTag.create(:tag   => "#programming",
               :count => 1,
               :user  => User.find_by_email("n.lanzanasto@gmail.com")
)

HashTag.create(:tag   => "#max",
               :count => 2,
               :user  => User.find_by_email("max.mustermann@gmail.com")
)

HashTag.create(:tag   => "#list",
               :count => 1,
               :user  => User.find_by_email("max.mustermann@gmail.com")
)
