class Player < DestinyAppResource

  #1 is xbox
  self.site = "http://www.bungie.net/Platform/Destiny/SearchDestinyPlayer/1/account_name/?ignorecase=true"

  private
  def self.find_single(scope, options)
    #prefix_options, query_options = split_options(options[:params])
    prefix_options = nil
    #path = element_path(scope, prefix_options, query_options)
    #raise "site: #{Account.site}, scope: #{scope}, options: #{options}"
    path = Player.site.to_s.sub("account_name", scope).sub("http://www.bungie.net", "")
    #raise "path: #{path}"
    instantiate_record(format.decode(connection.get(path, headers).body), prefix_options)
  end

end

