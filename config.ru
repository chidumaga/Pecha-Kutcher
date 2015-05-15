require 'rubygems'
require File.join(File.dirname(__FILE__), 'lib/pecha_kutcher.rb')
use Rack::Static, :urls => ["/css", "/images"], :root => "public"
run Pecha_Kutcher

