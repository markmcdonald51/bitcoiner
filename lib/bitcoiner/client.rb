module Bitcoiner
  class Client
    def initialize
      config_file = File.open(File.join(Rails.root, "config", "bitcoiner.yml"))
      config = YAML::load(config_file)[Rails.env].symbolize_keys

      @client = JsonWrapper.new(
		    config[:url],
        config[:username],
        config[:password]
      )
    end

    def method_missing(method, *args)
      @client.request({
          :method => method.to_s.gsub(/\_/, ""),
          :params => args
        }
      )
    end
  end
end
