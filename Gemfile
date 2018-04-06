source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.1'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

group :development, :test do
  # default setting
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'

  # for debug
  gem 'pry-rails'
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :development do
  # default setting
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  # for letter opener
  gem 'letter_opener_web'
  gem "letter_opener"
end

# for env
gem 'dotenv-rails'

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# パスワードハッシュ化に必要
gem 'bcrypt', '3.1.11'

# ログイン機能に必要（google・facebook・twitter）
gem 'devise'
gem 'omniauth'
gem 'omniauth-google-oauth2'
gem 'omniauth-twitter'
gem 'omniauth-facebook'

# 画像アップロードに必要
gem 'carrierwave'
# アップロードした画像のサイズ変更に必要
gem 'mini_magick'

# 検索機能追加
gem "ransack"

# ページング機能追加
gem 'kaminari'

# ページング機能のブートストラップ
gem 'kaminari-bootstrap'

# グラフ
gem "chartkick", '~> 2.2.0'

# アイコン
gem 'font-awesome-rails'

# herokuのrubyバージョン指定
source 'https://rubygems.org'
ruby '2.3.0'

# forレーダーチャート
gem 'chart-js-rails'

# 日本語化
gem 'rails-i18n'

# 確認ダイアログ
gem 'data-confirm-modal'

# 独自ドメインへのリダイレクト
gem 'rack-rewrite'

gem 'google-analytics-rails'

# for S3
gem 'fog'
