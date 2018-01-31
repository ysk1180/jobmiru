class Contact < ApplicationRecord
  validates :contact_name, presence: true, length: { maximum: 255 }
  validates :contact_email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :contact_content, presence: true
end
