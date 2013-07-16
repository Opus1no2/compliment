require 'yaml'
require 'faraday'

require_relative 'configurable'

class Compliment < Hash

  def initialize(&block)
    configure(&block) if block_given?
  end
  
  def configurable
    @config = Configurable.new 
  end
  
  # Convenience method allowing config
  # options  to be set in a block
  def configure
    yield configurable
    self
  end
  
  # Randomly select message from YAML file
  def get_message
    File.open @config.data do |file|
      self[:message] = YAML.load(file).sample
    end
  end
  
  # Merge hash for http query
  def options 
    self.merge!(@config.opts)
  end
  
  # Get random message and send
  def send_message
    self.get_message
    self.conn.get.status
  end
  
  # Build Faraday connection for HTTP request  
  def conn
    Faraday.new(:url => @config.url) do |c|
      c.adapter Faraday.default_adapter
      c.headers['User-Agent'] = @config.usr_agent
      c.params = self.options
    end
  end
end