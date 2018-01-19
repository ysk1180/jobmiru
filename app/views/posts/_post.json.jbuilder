json.extract! post, :id, :id, :industry, :company_name, :division_name, :experience_year, :job_title, :job_category, :income, :job_content, :obtained_skill, :reward, :challenge, :join_reason, :leave_reason, :user_id, :created_at, :updated_at
json.url post_url(post, format: :json)
