class SerializableUser < JSONAPI::Serializable::Resource
  type 'users'

  attributes :email, :created_at, :updated_at

  link :self do
    @url_helpers.url_for(@object)
  end
end
