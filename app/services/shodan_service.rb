require 'shodanz'

# class ShodanService
#   def initialize(api_key)
#     @client = Shodanz.client(key: api_key)
#   end

#   def search_ip(ip)
#     begin
#       @client.host(ip)
#     rescue Shodan::Error => e
#       Rails.logger.error "Shodan API error: #{e.message}"
#       return nil  # Or handle the error differently (e.g., raise a custom exception)
#     end
#   end
# end

class ShodanService
    def initialize(api_key)
        @client = Shodanz.client.new(key: api_key)
    end

    def search_ip(ip)
    #   client = Shodanz.client
      @client.host(ip)
    end
end