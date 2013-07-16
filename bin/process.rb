#!/usr/bin/env ruby
require '../lib/compliment'

c = Compliment.new do |configure|
  configure.to   = 9524577652
  configure.from = 2122569386
  configure.key  = 'YOUR API KEY'
end

c.send_message