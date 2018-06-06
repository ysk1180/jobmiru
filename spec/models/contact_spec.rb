require 'rails_helper'

RSpec.describe Contact, type: :model do
  # 有効なファクトリを持つこと
  it "has a valid factory" do
    expect(FactoryGirl.build(:contact)).to be_valid
  end
  # 名前とメールアドレスと内容があれば有効な状態であること
  it "is valid with a name, email and content" do
    contact = FactoryGirl.build(:contact)
    expect(contact).to be_valid
  end
  # 名前がなければ無効な状態であること
  it "is invalid without a name" do
    contact = FactoryGirl.build(:contact, name: nil)
    contact.valid?
    expect(contact.errors[:name]).to include("入力してください")
  end
  # 名前が255文字より多ければ無効な状態であること
  it "is invalid when name is over 255 words" do
    contact = Contact.new(name: "a"*256)
    contact.valid?
    expect(contact.errors[:name]).to include("　255文字以内で入力してください")
  end
  # 名前が255文字であれば有効であること
  it "is valid when name is 255 words" do
    contact = Contact.new(
      name: "a"*255,
      email: "tester@example.com",
      content: "ask"
    )
    expect(contact).to be_valid
  end
  # メールアドレスがなければ無効な状態であること
  it "is invalid without an email" do
    contact = Contact.new(email: nil)
    contact.valid?
    expect(contact.errors[:email]).to include("入力してください")
  end
  # メールアドレスが255文字より多ければ無効な状態であること
  it "is invalid when email is over 255 words" do
    contact = FactoryGirl.build(:contact, email: "a@a."+"a"*252)
    contact.valid?
    expect(contact.errors[:email]).to include("　255文字以内で入力してください")
  end
  # メールアドレスが255文字であれば有効であること
  it "is valid when email is 255 words" do
    contact = FactoryGirl.build(:contact, email:"a@a."+"a"*251)
    expect(contact).to be_valid
  end
  # メールアドレスがメールアドレスの形式でなければ無効であること
  it "is invalid without email format" do
    contact = Contact.new(email: "aaaaa")
    contact.valid?
    expect(contact.errors[:email]).to include("正しい形で入力ください")
  end
  # 内容がなければ無効な状態であること
  it "is invalid without a content" do
    contact = Contact.new(content: nil)
    contact.valid?
    expect(contact.errors[:content]).to include("入力してください")
  end
end
