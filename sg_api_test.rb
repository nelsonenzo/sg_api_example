require 'sinatra'
require 'base64'
require 'json'
require 'net/http'
require 'uri'
CLIENT_ID = '45234'
CLIENT_PASSWORD = 'pa55w0rd'

MOBILE_USER_AGENTS = 'palm|blackberry|nokia|phone|midp|mobi|symbian|chtml|ericsson|minimo|audiovox|motorola|samsung|telit|upg1|windows ce|ucweb|astel|plucker|x320|x240|j2me|sgh|portable|sprint|docomo|kddi|softbank|android|mmp|pdxgw|netfront|xiino|vodafone|portalmmm|sagem|mot-|sie-|ipod|up\.b|webos|amoi|novarra|cdm|alcatel|pocket|iphone|mobileexplorer|ipad|mobile'

get '/' do
  # if is_mobile_device?(request.env['HTTP_USER_AGENT']) and not matchy("ipad",request.env['HTTP_USER_AGENT'])
    # erb :index_mobile, :layout => :layout_mobile
  # else
    erb :index
  # end
end

get '/get_session_token' do
  res = Net::HTTP.get(URI.parse("http://api.stargreetz.com/v1?client_id=#{CLIENT_ID}&password=#{CLIENT_PASSWORD}"))
  return res
end

get '/preview' do
  params.merge!({"product" => 693,"join_3" => 38703,"join_6" => 38716,"join_8" => 38750 ,"join_9" => 38895})
  res = Net::HTTP.post_form(URI.parse("http://api.stargreetz.com/preview"), params)
  return res.body
end

get '/confirm_purchase' do
  res = Net::HTTP.post_form(URI.parse("http://api.stargreetz.com/confirm_purchase"), params)
  return res.body
end

