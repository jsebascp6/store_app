module Requests
  module Http

    def self.base(url, headers={}, &block)
      Faraday.new(
        url: url,
        headers: headers,
        &block
      )
    end
  end
end
