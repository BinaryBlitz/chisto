class IconUploader < ApplicationUploader
  process resize_to_limit: [120, 120]
end
