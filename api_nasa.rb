require "uri"
require "net/http"
require "json"

def request(address, key) ##recibe url y api_key
    url = URI(address+"&api_key="+key)
    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true
    request = Net::HTTP::Get.new(url)

    response = https.request(request)
    body = JSON.parse response.read_body
end

data = request('https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=10', 'LFwG79pBQefdANB7vXXq4iKpWhOV22w69bHbVR51')

def buid_web_page(data) ##crea página web con response del request
    img = data["photos"].map{|x| x['img_src']}
    html_img = ""
    img.each do |img|
        html_img += "\t\t<li><img src=\"#{img}\"></li>\n"
    end
    #se crea estructura del HTML
    html = "<html>\n<head>\n\t<meta charset='UTF-8'>\n\t<meta http-equiv='X-UA-Compatible' content='IE=edge'>\n\t<meta name='viewport' content='width=device-width, initial-scale=1.0'>\n<link rel='stylesheet' href='assets/css/style.css'>\n</head>\n<body>\n\t<ul>\n#{html_img}\t</ul>\n</body>\n</html>"
    File.write('index.html', html)
end

buid_web_page(data)