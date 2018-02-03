class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true, length: { maximum: 50 }

  # 投稿へのいいね機能のためのアソシエーション
  has_many :like_to_posts, dependent: :destroy

  # 投稿への働きたい機能のためのアソシエーション
  has_many :want_to_works, dependent: :destroy

  # 投稿へのコメント機能のためのアソシエーション
  has_many :posts, dependent: :destroy
  has_many :comment_to_posts, dependent: :destroy

  # 投稿のコメントへの返信機能のためのアソシエーション
  has_many :reply_to_comments, dependent: :destroy

  # 画像アップロード設定
  mount_uploader :user_image, UserImageUploader

  # Twitterログイン用
  devise :database_authenticatable, :registerable,:confirmable,
         :recoverable, :rememberable, :trackable,:validatable,:omniauthable,omniauth_providers: [:twitter]

  attr_accessor :current_password

  def self.from_omniauth(auth) #先ほど用意したカラムに入れる情報
    find_or_create_by(provider: auth["provider"], uid: auth["uid"]) do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.email = User.dummy_email(auth)
      # user.password = Devise.friendly_token[0, 20]
      user.remote_user_image_url  = auth["info"]["image"]  # gem 'carriawave'を使用している場合は、remote_avatar_urlとする必要がある
    end
  end

  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"]) do |user|
        user.attributes = params
      end
    else
      super
    end
  end

      # Edit時、OmniAuthで認証したユーザーのパスワード入力免除するため、Deviseの実装をOverrideする。
  def update_with_password(params, *options)
    if encrypted_password.blank?            # encrypted_password属性が空の場合
      update_attributes(params, *options)   # パスワード入力なしにデータ更新
    else
      super
    end
  end


  private
    def self.dummy_email(auth)
      "#{auth["uid"]}-#{auth["provider"]}@example.com"
    end

  protected
    def confirmation_required?
      false
    end

    def password_required?
      super && provider.blank?  # provider属性に値があればパスワード入力免除
    end

end
