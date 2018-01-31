class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save

      # DIVERテキスト通り追記
      ContactMailer.contact_mail(@contact).deliver

      # リダイレクト先を@content(お問い合わせ一覧)から、root(トップページ)へ変更
      redirect_to root_path, notice: 'お問い合わせを承りました。ありがとうございます。'
    else
      render :new
    end
  end

  private
    def contact_params
      params.require(:contact).permit(:contact_name, :contact_email, :contact_content)
    end
end
