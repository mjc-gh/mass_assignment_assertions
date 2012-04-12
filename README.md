Mass Assignment Assertions
==========================

Rails Unit Test Assertions for ensuring attributes are marked protected.


Usage
-----

Add to `Gemfile`:

    group :test do
      gem 'mass_assignment_assertions'
    end

Then in your unit tests:

    def test_attrs_protected
      assert_attr_protected Model, :user_id, :post_id
    end

The `assert_attr_protected` takes either a model class or an instance of a model.


