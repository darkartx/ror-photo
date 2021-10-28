class ApplicationRecord < ActiveRecord::Base
  include ActiveStorageSupport::SupportForBase64
  # include ActiveModel::Serializers
  
  self.abstract_class = true
end
