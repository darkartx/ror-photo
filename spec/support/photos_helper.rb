require 'faker'
require 'factory_bot_rails'

module PhotosHelper
  def create_photo(base64_image)
    FactoryBot.create(:photo,
      title: Faker::Name.name,
      image_original: { data: base64_image }
    )    
  end

  def build_photo(base64_image)
    FactoryBot.build(:photo,
      title: Faker::Name.name,
      image_original: { data: base64_image }
    )
  end
end
