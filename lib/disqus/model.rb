module Disqus
  class Model
    extend Disqus::Concerns::Buildable

    def self.api_key
      fail 'DISQUS_API_KEY not configured. Please add DISQUS_API_KEY to your .env' if ENV['DISQUS_API_KEY'].nil?

      ENV['DISQUS_API_KEY']
    end

    def api_key
      Disqus::Model.api_key
    end

    def self.make_request(url, method=:get)
      method    = method.to_sym
      http      = Curl.send method, url
      response  = JSON.parse(http.body_str)

      fail "ERROR CODE #{response['code']} :: #{response['response']}" unless http.status == '200 OK'

      response['response']
    end

    def self.read_config_file
      file_path = "#{APPLICATION_PATH}/config/settings.yml"
      fail 'File config/settings.yml does not exist' unless File.exist? file_path

      YAML.load_file file_path
    end
  end
end
