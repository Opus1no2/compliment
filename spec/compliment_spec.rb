require File.join(File.dirname(__FILE__), '..', 'lib', 'compliment')
require File.join(File.dirname(__FILE__), '..', 'lib', 'configurable')

describe Compliment do

  before(:each) do 
    @c = Compliment.new do |configure|
      configure.to   = 9524577652
      configure.from = 2122569386
      configure.key  = 'YOUR API KEY'
    end
    @config = Configurable.new
  end
  
  it 'should return http status 200' do 
    result = @c.send_message
    result.should == 200
  end
  
  it 'should get a random message' do 
    result = @c.get_message
    YAML.load(@config.data).include? result
  end
end