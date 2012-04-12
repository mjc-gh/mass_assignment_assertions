require 'minitest/autorun'
require 'active_support'
require 'active_model'

require 'mass_assignment_assertions'
require 'models'

class TestMassAssignmentAssertions < ActiveSupport::TestCase
  def test_empty_model
    assert_raises(MiniTest::Assertion) do
      assert_attr_protected EmptyModel, :attribute
    end
  end

  def test_empty_model_instance
    assert_raises(MiniTest::Assertion) do
      assert_attr_protected EmptyModel.new, :attribute
    end
  end

  def test_accessible_model
    assert_raises(MiniTest::Assertion) do
      assert_attr_protected AccessibleModel, :user_name, :post_title
    end
    # these attributes are protected implicitly (WhiteList)
    assert_attr_protected AccessibleModel, :user_id, :post_id
  end

  def test_accessible_model_instance
    object = AccessibleModel.new

    assert_raises(MiniTest::Assertion) do
      assert_attr_protected object, :user_name, :post_title
    end
    # these attributes are protected implicitly (WhiteList)
    assert_attr_protected object, :user_id, :post_id
  end

  def test_protected_model
    assert_attr_protected ProtectedModel, :user_id, :post_id
  end

  def test_protected_model_instance
    assert_attr_protected ProtectedModel.new, :user_id, :post_id
  end

  def test_not_a_model
    assert_attr_protected Class.new, :attribute
    fail 'test not model failed'

  rescue Exception => e
    assert_match(/must supply a model class or instance/, e.message)
  end
end
