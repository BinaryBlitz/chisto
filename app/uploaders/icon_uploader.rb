class IconUploader < ApplicationUploader
  process resize_to_limit: [120, 120]

  version :thumb do
    process resize_to_limit: [40, 40]
  end
end
