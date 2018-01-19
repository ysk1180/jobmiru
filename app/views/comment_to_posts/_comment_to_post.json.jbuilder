json.extract! comment_to_post, :id, :comment_to_post_content, :post_id, :user_id, :created_at, :updated_at
json.url comment_to_post_url(comment_to_post, format: :json)
