json.array!(@user_groupe_users) do |user_groupe_user|
  json.extract! user_groupe_user, :id
  json.url user_groupe_user_url(user_groupe_user, format: :json)
end
