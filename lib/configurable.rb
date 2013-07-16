require 'faraday'

class Configurable

  URL = 'https://secure.ifbyphone.com/ibp_api.php'
  AGENT = 'Ifbyphone-compliment-request'
  COMPLIMENTS = '../data/comp.yaml'
  
  TIMEOUT = 60
  
  attr_accessor :to
  attr_accessor :from
  attr_accessor :key
  attr_accessor :url
  attr_accessor :usr_agent
  attr_accessor :data
  
  def initialize 
    self.url = URL  
    self.usr_agent = AGENT
    self.data = COMPLIMENTS
  end
  
  def opts
    {
      :api_key => self.key,
      :action  => 'sms.send_message',
      :to      => self.to,
      :from    => self.from
    }
  end 
end