Puppet::Parser::Functions::newfunction(:md5_sum, :type => :rvalue,
        :doc => "Returns a MD5 hash value from a provided string.") do |args|

            require 'digest/md5'

            Digest::MD5.hexdigest(args[0])
end
