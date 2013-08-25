# encoding: UTF-8
puts "Seeding notes"

Note.create(:content  => "Spatzldough\n\n#receipt #dough\n\Ingredients:\n- flour\n- water\n- eggs\n\nScramble, done.",
            :user     => User.find_by_email("n.lanzanasto@gmail.com")
           )

Note.create(:content => "Dessert\n\n#receipt #dessert\n\Ingredients:\n- sugar\n- water\n- eggs\n\nScramble, done.",
            :user     => User.find_by_email("n.lanzanasto@gmail.com")
           )

Note.create(:content => "Save database entry\n\n#ruby #programming\n\nAn explanation can be found here.",
            :user     => User.find_by_email("n.lanzanasto@gmail.com")
           )

Note.create(:content => "Max list\n\n#max #list\n\nThe list of Max.",
            :user     => User.find_by_email("max.mustermann@gmail.com")
           )

Note.create(:content => "Max list 2\n\n#max\n\nAnother list of Max.",
            :user     => User.find_by_email("max.mustermann@gmail.com")
           )
