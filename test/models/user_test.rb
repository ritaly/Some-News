require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'the truth' do
    assert true
  end
#co z current user
  test 'should not save user without email ' do
    user = User.new(username: 'useruser', password: 'test')
    assert_not user.save
  end
  test 'should not save user without username' do
    user = User.new(password: 'useruserusesr', email: 'test@t.pl')
    assert_not user.save
  end
  test 'should not save user without password' do
    user = User.new(username: 'useruseruser', email: 'test@t2.pl')
    assert_not user.save
  end
  test 'should not save user with password shorter than 6' do
    user = User.new(password: 'u', username: 'user', email: 'test@t2.pl')
    assert_not user.save
  end
  test 'should not save user with password longer than 20' do
    user = User.new(password: 'u'*21, username: 'user', email: 'test@t2.pl')
    assert_not user.save
  end
end
