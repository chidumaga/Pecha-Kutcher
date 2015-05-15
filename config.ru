require 'rubygems'
require File.join(File.dirname(__FILE__), 'lib/server.rb')
use Rack::Static, :urls => ["/css", "/images"], :root => "public"
run PechaKutcherWeb

