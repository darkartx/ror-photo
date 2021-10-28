require 'faker'
require 'open-uri'
require 'base64'

module ImageHelpers
  def base64_image(src, format)
    img = URI.open(src)
    "data:image/#{format};base64,#{Base64.strict_encode64(img.read)}"
  end

  def faker_base64_image(size='200x200', format='png')
    src = Faker::Avatar.image(size: size, format: format)
    base64_image(src, format)
  end
end
