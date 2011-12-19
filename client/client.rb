#!/usr/bin/env ruby
require 'rubygems'
require 'memcached'
require 'sinatra'
require 'haml'
#require 'sass'
$id=Array.new();
$cache = Memcached.new 'localhost:54321' 
get '/client' do
  haml :client_index
end
get '/' do
		$id[0]=$cache.get('id1')
		$id[1]=$cache.get('id2')
		$id[2]=$cache.get('id3')
		$main=$cache.get('main1')
		$main2=$cache.get('main2')
		$main3=$cache.get('main3')
		@contents=$main.split("-.-.-.-")
		@contents2=$main2.split("-.-.-.-")
		@contents3=$main3.split("-.-.-.-")
  haml :index
end

get '/main1' do
	@contents=$main.split("-.-.-.-")
	haml :main
end

get '/main2' do
	@contents=$main2.split("-.-.-.-")
	haml :main
end

get '/main3' do
	@contents=$main3.split("-.-.-.-")
	haml :main
end

