class ImageUploader < ApplicationUploader
  version :thumb do
    process resize_to_limit: [200, 200]
  end
end
