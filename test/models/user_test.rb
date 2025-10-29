require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user=User.new(name: "example", email: "minami@mail.com",
                   password: "foobar", password_confirmation: "foobar")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be presence" do
    @user.name="  "
    assert_not @user.valid?
  end

  test "email should be presence" do
    @user.email= "   "
    assert_not @user.valid?
  end

  test "email adress shold be unique" do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end

  test "password should be presence (nonblank)" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password should have a minimum length " do
    @user.password = @user.password_confirmation="a"*5
    assert_not @user.valid?
  end
end
