module ApplicationHelper
  def get_twitter_card_info(post)
    twitter_card = {}
    if post
      twitter_card[:url] = post.url
      twitter_card[:title] = '会社名：#{post.name}'
      twitter_card[:description] = "スキル："
      twitter_card[:image] = set_post_img(post.image_src)
    else
      twitter_card[:url] = 'https://jobmiru.herokuapp.com/'
      twitter_card[:title] = 'Jobmiru〜「何が出来るようになるか」で会社を選べる世界に'
      twitter_card[:description] = '「何のスキルが身につくのか」「具体的に何をするのか」に特化した、実際に働いた社員の声の共有サイトです。'
      twitter_card[:image] = 'https://github.com/ysk1180/jobmiru/blob/master/app/assets/images/top_shot3.png?53535'
    end
    twitter_card[:card] = 'summary_large_image'
    twitter_card[:site] = '@ysk_pro'
    twitter_card
  end
end
