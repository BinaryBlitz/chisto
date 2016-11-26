class ImageUploader < ApplicationUploader
  process resize_to_limit: [960, 960]
  process convert: 'jpg'
  process quality: 90

  version :thumb do
    process resize_to_limit: [240, 240]
  end
end
