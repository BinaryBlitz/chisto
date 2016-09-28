class LogoUploader < ApplicationUploader
  version :thumb do
    process resize_to_limit: [100, 100]
  end
end
