
require 'net/http'

# Net::HTTP.start('http://api.t.sina.com.cn') {|http|
#   req = Net::HTTP::Get.new('/statuses/friends.xml?source=1546247767')
#   req.basic_auth "whyruby@gmail.com","19861007"
#   response = http.request(req)
#   print response.body
# }                   
       


# res = Net::HTTP.get_response('http://whyruby@gmail.com:19861007@http://api.t.sina.com.cn/statuses/friends.xml?source=1546247767')
# print res.body
#                           



require'net/http'
require'base64'
url="http://api.t.sina.com.cn/statuses/friends.xml?source=1546247767"
user="whyruby@gmail.com"
password="19861007"
basic_str="Basic #{Base64.encode64(user+":"+password)}"
url=URI.parse(url)
http=Net::HTTP.new(url.host,url.port)
resp=http.get(url.path,{"Authorization" => basic_str})
puts resp.code
puts resp.body
