class SerializablePhoto < JSONAPI::Serializable::Resource
  type 'photos'

  attributes :title, :views, :created_at, :updated_at

  attribute :image_original do
    @object.image_original.url
  end

  attribute :image do
    @object.image.url
  end

  attribute :image_preview do
    @object.image_preview.url
  end

  link :self do
    @url_helpers.url_for(@object)
  end
end
