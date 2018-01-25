json.extract! reply_to_comment, :id, :reply_to_comment_content, :post_id, :user_id, :comment_to_post_id, :created_at, :updated_at
json.url reply_to_comment_url(reply_to_comment, format: :json)
