class ModelBase
  include ActiveModel::MassAssignmentSecurity
end

class EmptyModel < ModelBase
end

class AccessibleModel < ModelBase
  attr_accessible :user_name, :post_title
end

class ProtectedModel < ModelBase
  attr_protected :user_id, :post_id
end

