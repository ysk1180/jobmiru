json.extract! contact, :id, :contact_name, :contact_email, :contact_content, :created_at, :updated_at
json.url contact_url(contact, format: :json)
