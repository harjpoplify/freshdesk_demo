module FreshDesk::Tickets
  extend self
  FRESH_DESK_URI = URI(Figaro.env.freshdesk_uri)

  def push(info)
    headers = { 'Content-Type' => "application/json" }
    body = {
      name: info[:name],
      email: info[:email],
      phone: info[:phone],
      subject: info[:subject],
      description: info[:description],
      priority: 1, # low
      status: 2 # portal
    }

    http = Net::HTTP.new(FRESH_DESK_URI.host, FRESH_DESK_URI.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Post.new(FRESH_DESK_URI.path, headers)
    request.body = body.to_json
    request.basic_auth(Figaro.env.freshdesk_key, Figaro.env.freshdesk_pass)

    response = http.request(request)

    response && response.body && JSON.parse(response.body)['requester_id'].present?
  end
end
