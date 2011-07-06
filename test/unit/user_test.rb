require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end

  test "user attributes must not be empty" do
    user = User.new
    assert user.invalid?
    assert user.errors[:name].any?
    assert user.errors[:email].any?
    assert user.errors[:password].any?
    assert user.errors[:zipcode].any?
    assert user.errors[:industry].any?
  end

  
end
