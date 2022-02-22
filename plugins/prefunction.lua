return function()
    local apikey = kong.request.get_header("x-api-key")
    if not apikey then
        return kong.response.exit(401, '{ "error": "Unauthorized", "statusCode":401 }')
    end

    local keyauth = {}
    keyauth.key = apikey
    local apikey_id = kong.db.keyauth_credentials:select(keyauth)
    if not apikey_id then
        return kong.response.exit(401, '{ "error": "Unauthorized", "statusCode":401 }')
    end

end
