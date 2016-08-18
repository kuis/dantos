User.destroy_all
Goomp.destroy_all

goomps = FactoryGirl.create_list :goomp, 5
goomps.each do |goomp|
  FactoryGirl.create_list :membership, 20, goomp: goomp
  users = goomp.members
  40.times do
    post = FactoryGirl.create :post, goomp: goomp, user: users.sample
    3.times do
      FactoryGirl.create :comment, post: post, user: users.sample
    end
  end
end

FactoryGirl.create :user, email: 'cqpanxu@gmail.com'