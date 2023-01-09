require 'httparty'

def handler(event:, context:)
  body = HTTParty.get("https://github.com").body

  { statusCode: 200, body: body }
end
