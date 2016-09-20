#User.destroy_all


u = User.where(:email => 'manager@goomp.co').first
u.update!({:picture => 'http://dantos-production.kta86kespy.us-west-2.elasticbeanstalk.com/favicon.ico'}) unless u.nil?

FactoryGirl.create(
  :user,
  :email => 'manager@goomp.co',
  :password => 'qwertyuiop',
  :password_confirmation => 'qwertyuiop',
  :username => 'goompmanager',
  :first_name => 'Manager',
  :last_name => 'Goomp',
  :slug => 'goomp-manager',
  :headline => 'Manager',
  :picture => 'http://dantos-production.kta86kespy.us-west-2.elasticbeanstalk.com/favicon.ico') unless User.where(:email => 'manager@goomp.co').first