require 'rails_helper'
require 'faker'

RSpec.describe Photo, type: :model do
  let (:image) { { data: faker_base64_image } }
  let (:title) { Faker::Name.name }
  let (:invalid_title) { Faker::Name.name[0, 2] }
  
  # GIF format is invalid
  let (:invalid_image) { { data: faker_base64_image(format: 'gif') } }

  # Image size > 10 MB
  let (:large_image) { { data: base64_image(
    'https://www.learningcontainer.com/wp-content/uploads/2020/07/Large-Sample-Image-download-for-Testing.jpg',
    'jpg'
  ) } }

  it 'is valid with valid attributes' do
    photo = Photo.new(
      title: title,
      image_original: image
    )
    expect(photo).to be_valid
  end

  it 'is invalid without title' do
    photo = Photo.new(
      title: title
    )
    expect(photo).to_not be_valid
  end

  it 'is invalid without image' do
    photo = Photo.new(
      image_original: image
    )
    expect(photo).to_not be_valid
  end

  it 'is invalid win title length less than 3' do
    photo = Photo.new(
      title: invalid_title
    )
    expect(photo).to_not be_valid
  end

  it 'is invalid with large image' do
    photo = Photo.new(
      image_original: large_image
    )
    expect(photo).to_not be_valid
  end
end
