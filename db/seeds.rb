user=User.new(:username => 'test-user-01',:email => 'rqisti1205@yahoo.co.jp', :password =>'password')
user.skip_confirmation!
user.save!
