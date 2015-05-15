require 'rubygems'
require File.join(File.dirname(__FILE__), 'lib/pecha_kutcher.rb')

run Pecha_Kutcher
use Rack::Static, :urls => ["/css", "/images"], :root => "public"
