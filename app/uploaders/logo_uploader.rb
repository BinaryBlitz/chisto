class LogoUploader < ApplicationUploader
  process resize_to_limit: [150, 150]
end
