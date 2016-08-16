# dnsLookup.rb
# does a DNS lookup and returns an array of strings of the results
 
require 'resolv'
 
Puppet::Parser::Functions.newfunction(:dnsLookup, 
                                      :type => :rvalue
                                      :doc => <<-'ENDOFDOC'
Takes a DNS lookup type ('addr', 'addrs', 'name', 'names')
and returns value.

  addr  : Accepts a fully qualified DNS name; Returns an IP adddress
  addrs : Accepts a fully qualified DNS name; Returns multiple IP addresses, if they exist
  name  : Accepts an IP address; Returns a fully qualified DNS name
  names : Accepts an IP address; Returns multiple fully qualified DNS names(s)
 
*Examples:*

    dnsLookup('addr', "localhost")

Would return: "127.0.0.1"

    dnsLookup('name', "127.0.0.1")

Would return: "localhost"
ENDOFDOC
) do |vals|
  type, param = vals
  raise(ArgumentError, 'Must specify a lookup type') unless type
  raise(ArgumentError, 'Must specify name of a lookup') unless param and param.instance_of? String

  return '' if param.empty?

  res = new(resolvers=['skydns.jewelry.acn'])

  case type
    when 'address'
      return res.getaddress(param)
    when 'addresses'
      return res.getaddresses(param)
    when 'name' 
      return res.getname(param)
    when 'names'
      return res.getnames(param)
    else
      return nil
  end
end
