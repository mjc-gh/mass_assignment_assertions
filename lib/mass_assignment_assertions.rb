module ActiveSupport
  module Testing
    module Assertions
      def assert_attr_protected(model, *attributes)
        model = model.class unless model.respond_to?(:protected_attributes)

        attributes.each do |attribute|
          if model.accessible_attributes.any?
            assert_not_includes model.accessible_attributes, attribute
          else
            assert_includes model.protected_attributes, attribute
          end
        end

      rescue NoMethodError
        raise ArgumentError.new('must supply a model class or instance')
      end
    end
  end
end

