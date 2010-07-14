class PostageApp::Configuration
  
  # +true+ for https, +false+ for http connections (default: is +true+)
  attr_accessor :secure
  
  # The API key for your postageapp.com project
  attr_accessor :api_key
  
  # The protocol used to connect to the service (default: 'https' for secure 
  # and 'http' for insecure connections)
  attr_accessor :protocol
  
  # The host to connect to (default: 'api.postageapp.com')
  attr_accessor :host
  
  # The port on which PostageApp service runs (default: 443 for secure, 80 for 
  # insecure connections)
  attr_accessor :port
  
  # The hostname of the proxy server (if using a proxy)
  attr_accessor :proxy_host
  
  # The port of the proxy server (if using proxy)
  attr_accessor :proxy_port
  
  # The username for the proxy server (if using proxy)
  attr_accessor :proxy_user
  
  # The password for the proxy server (if using proxy)
  attr_accessor :proxy_pass
  
  # The HTTP open timeout in seconds (defaults to 2).
  attr_accessor :http_open_timeout
  
  # The HTTP read timeout in seconds (defaults to 5).
  attr_accessor :http_read_timeout
  
  # The email address that all send_message method should address
  # all messages while overriding original addresses
  attr_accessor :recipient_override
  
  # A list of environments when there's no connection made to the service
  attr_accessor :development_environments
  
  # A list of API method names payloads of which are captured and resent
  # in case of service unavailability
  attr_accessor :failed_requests_to_capture
  
  # The file path where all failed requests are saved
  attr_accessor :failed_requests_path
  
  # The logger used by this gem
  attr_accessor :logger
  
  def initialize
    @secure                     = true
    @host                       = 'api.postageapp.com'
    @http_open_timeout          = 5
    @http_read_timeout          = 10
    @development_environments   = %w( test )
    @failed_requests_to_capture = %w( send_message )
  end
  
  alias_method :secure?, :secure
  
  def protocol
    @protocol || if secure?
      'https'
    else
      'http'
    end
  end
  
  def port
    @port || if secure?
      443
    else
      80
    end
  end
  
  def url
    "#{self.protocol}://#{self.host}:#{self.port}"
  end
  
end