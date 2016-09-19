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
  :picture => 'http://goomp.co/assets/square-logo-055f9a0dcbf3ab38fb6f1af03e735779ed8ee85b9e64a85245bc01d3a5a8882f.ico') unless User.where(:email => 'manager@goomp.co').first