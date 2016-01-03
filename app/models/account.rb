class Account < DestinyAppResource
  #self.site = "http://www.bungie.net/platform/destiny/1/account/accountName/summary/?ignorecase=true"
  self.site = "http://www.bungie.net/Platform/Destiny/1/Account/accountName/Summary/?ignorecase=true"

  def self.find(*arguments)
    if arguments.size != 1
      raise "Can only pass one arguement for accounts"
    else
      scope   = arguments.slice!(0)
      options = arguments.slice!(0)
      find_single(scope, options)
    end
  end
  
  private
  def self.find_single(scope, options)
    #prefix_options, query_options = split_options(options[:params])
    prefix_options = nil
    #path = element_path(scope, prefix_options, query_options)
    #raise "site: #{Account.site}, scope: #{scope}, options: #{options}"
    path = Account.site.to_s.sub("accountName", scope).sub("http://www.bungie.net", "")
    #raise "path: #{path}"
    instantiate_record(format.decode(connection.get(path, headers).body), prefix_options)
  end
end

