module ApplicationHelper
  def get_twitter_card_info(post)
    twitter_card = {}
    if post
      twitter_card[:url] = "https://jobmiru.herokuapp.com/posts/#{post.id}"
      twitter_card[:title] = 'Jobmiruへの投稿'
      twitter_card[:description] = "会社名：#{post.company_name}　身についたスキル：#{post.skill1}、#{post.skill2}、#{post.skill3}"
    else
      twitter_card[:url] = 'https://jobmiru.herokuapp.com/'
      twitter_card[:title] = 'Jobmiru〜「何が出来るようになるか」で会社を選べる世界に'
      twitter_card[:description] = '「何のスキルが身につくのか」「具体的に何をするのか」に特化した、実際に働いた社員の声の共有サイトです。'
    end
    twitter_card[:card] = 'summary_large_image'
    twitter_card[:image] = "https://raw.githubusercontent.com/ysk1180/jobmiru/master/app/assets/images/top_shot4.png?32253"
    # twitter_card[:site] = '@ysk_pro'
    twitter_card
  end
end
