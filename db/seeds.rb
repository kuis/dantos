User.destroy_all
Goomp.destroy_all

goomps = FactoryGirl.create_list :goomp, 5
goomps.each do |goomp|
  FactoryGirl.create_list :membership, 20, goomp: goomp
  users = goomp.members
  40.times { FactoryGirl.create :post, goomp: goomp, user: users.sample }
end

FactoryGirl.create :user, email: 'cqpanxu@gmail.com'