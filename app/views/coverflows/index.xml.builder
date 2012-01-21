# xml.instruct! :xml, :version=>"1.0", :encoding=>"UTF-8"
# xml.artworkinfo do
# @coverflows.each do |coverflow|
#   xml.albuminfo do
#     xml.artLocation "../" + coverflow.cover.url(:thumb)
#     xml.artist coverflow.cflow.title
#     xml.albumName coverflow.cflow.title
#     xml.artistLink "#{polymorphic_path(coverflow.cflow)}"
#     xml.albumLink "#{polymorphic_path(coverflow.cflow)}"
#     end
#   end
# end


xml.instruct! :xml, :version=>"1.0", :encoding=>"UTF-8"
xml.gallery(:base => "", :background => "#000000", :text => "#ffffff", :link => "#0000ff", :alink => "#ff0000", :vlink => "#800080", :date => Time.now) do
  xml.images do
    @coverflows.each do |coverflow|
      xml.image(:path => (coverflow.cover.url(:medium)), :width => 70, :height => 70, :thumbpath => (coverflow.cover.url(:medium)), :thumbwidth => 70, :thumbheight => 70 ) do
        xml.meta(coverflow.cflow.title, :name => "title")
        xml.meta("#{
          if coverflow.cflow_type != "Link"
            polymorphic_path(coverflow.cflow)
          else
            coverflow.cflow.link_url
          end
          }", :name => "link")
        xml.meta("#{
          if coverflow.cflow_type != "Link"
            '_SELF'
          else
            '_BLANK'
          end
        }", :name => "linktarget")
        xml.description(coverflow.cflow.title)
      end
    end
  end
end

# <gallery
# base = ""
# background = "#FFFFFF"
# banner = "#F0F0F0"
# text = "#000000"
# link = "#0000FF"
# alink = "#FF0000"
# vlink = "#800080"
# date = "3/8/2008">
#   <sitename>Wedding Photo</sitename>
#   <photographer></photographer>
#   <contactinfo></contactinfo>
#   <email></email>
#   <security><![CDATA[]]> </security>
# 
# <banner font = "Arial" fontsize = "3" color =  "#F0F0F0"> </banner>
# <thumbnail base ="thumbnails/" font = "Arial" fontsize = "4" color = "#F0F0F0" border = "0" rows = "3" col = "5"> </thumbnail> 
# <large base ="images/" font = "Arial" fontsize = "3" color = "#F0F0F0" border = "0"> </large>
# <images id = "images">
# 
# 
# <image
# path = "iphone.png"
# width = "264"
# height = "500"
# thumbpath = "iphone.png"
# thumbwidth = "42"
# thumbheight = "80">
# <meta name="title">Apple iPhone</meta>
# </image>
# 
# </images>
# </gallery>