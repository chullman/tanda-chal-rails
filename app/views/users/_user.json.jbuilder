json.extract! user, :id, :name, :email_address, :password, :organisation_id, :created_at, :updated_at
json.url user_url(user, format: :json)
