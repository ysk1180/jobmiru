require 'rails_helper'

RSpec.feature "Contacts", type: :feature do
  # ユーザーは新しいお問い合わせをする
  scenario "user does a new contact" do
    visit root_path
    click_link "お問い合わせ"
    fill_in "名前", with: "name"
    fill_in "メールアドレス", with: "tester@example.com"
    fill_in "内容", with: "ask"
    click_button "送信"

    expect(page).to have_content "お問い合わせを承りました。ありがとうございます。"
  end
end
