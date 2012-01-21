class Issuu < ActiveResource::Base
  
  #self.site = "http://upload.issuu.com/1_0"
  self.site = "http://api.issuu.com/1_0"
  
  def self.upload_issuu(params)
    params[:action] = 'issuu.document.upload'
    base_sig = signature_hash(params)
      values = {
        :signature => base_sig,
        :access => 'public',
        # 'action' => 'issuu.document.upload',
        :apiKey => APP['issuu_key'],
        :description => params[:description],
        :format => "json",
        :name => params[:name],
        :file => params[:file]
      }
      headers = {
        'Content-Type' => "application/atom+xml; charset=UTF-8"
      }
      url = "http://upload.issuu.com/1_0"
      v = values.map {|k,v| "#{k}=#{v}"}.join("&")
      # raise values.to_yaml
      self.post(url, values, headers)
  end
  
  def self.signature_hash(params)
    sig = "#{APP['issuu_secret']}accesspublicactionissuu.document.uploadapiKey#{APP['issuu_key']}description#{params[:description]}formatjsonname#{params[:name]}"
    sig_hash = Digest::MD5.hexdigest(sig)
    return sig_hash
  end
  
  def self.bucket_fetch
    
  end
  
end
