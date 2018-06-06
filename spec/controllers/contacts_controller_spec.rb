require 'rails_helper'

RSpec.describe ContactsController, type: :controller do
  describe "#new" do
    # 正常にレスポンスを返すこと
    it "responds successfully" do
      get :new
      expect(response).to be_success
    end
  end
  describe "#create" do
    context "with valid attributes" do
      # お問い合わせできること
      it "do a contact" do
        contact_params = FactoryGirl.attributes_for(:contact)
        expect{
          post :create, params: { contact: contact_params }
        }.to change(Contact, :count).by(1)
      end
      # トップページにリダイレクトすること
      it "redirect to the top page" do
        contact_params = FactoryGirl.attributes_for(:contact)
        post :create, params: { contact: contact_params }
        expect(response).to redirect_to root_path
      end
    end
    context "with invalid attributes" do
      # お問い合わせができないこと
      it "does not do a contact" do
        contact_params = FactoryGirl.attributes_for(:contact, name: nil)
        expect{
          post :create, params: { contact: contact_params }
        }.to_not change(Contact, :count)
      end
    end
  end
end
