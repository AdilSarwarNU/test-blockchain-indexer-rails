json.is_success true
json.error_code nil
json.message "User Signed in successfully"
json.result do
  json.user @user
  json.token JsonWebToken.encode(sub: @user.id)
end
