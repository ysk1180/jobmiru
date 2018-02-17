class UserImageUploader < CarrierWave::Uploader::Base
  storage :file
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  include CarrierWave::MiniMagick
  # 画像サイズ制限（Twitter連携で持ってこれる48×サイズに合わせる
  process :resize_to_limit => [48,48]

  #ファイル形式 jpg,jpeg,gif,pngしか受け付けない
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  # デフォルト画像設定
  def default_url
    "default.png"
  end
end
