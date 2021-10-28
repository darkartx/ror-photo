require 'rack/mime'

class Photo < ApplicationRecord
  IMAGE_PROCESSING_OPTIONS = {
    image: { format: :webp },
    image_preview: { resize: '100x100^' }
  }

  has_one_base64_attached :image_original

  validates :title, 
            presence: true, 
            length: { minimum: 3 }

  validates :image_original, 
            attached: true, 
            content_type: %w[image/png, image/jpg, image/jpeg], 
            size: { less_than: 10.megabytes }

  before_create do
    ext = ::Rack::Mime::MIME_TYPES.invert[self.image_original.content_type]
    self.image_original.filename = "#{self.title}#{ext}"
  end

  IMAGE_PROCESSING_OPTIONS.each do |method_name, options|
    define_method "#{method_name}" do      
      self.image_original.variant(options).processed
    end
  end
end
