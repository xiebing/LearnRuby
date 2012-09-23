require 'net/http'
require 'uri'

module Net
  class HTTP
    def HTTP.get_with_headers(uri, headers=nil)
      uri = URI.parse(uri) if uri.respond_to? :to_str
      start(uri.host, uri.port) do |http|
        return http.get(uri.path, headers)
      end
    end
  end
end

res = Net::HTTP.get_with_headers('http://www.google.com/', {'Accept-language' => 'de'})
p s = res.body.size
p res
p res.body[s-200..s-140]