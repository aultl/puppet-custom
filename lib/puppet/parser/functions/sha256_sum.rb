Puppet::Parser::Functions::newfunction(:sha256_sum, :type => :rvalue,
        :doc => "Returns a SHA256 hash value from a provided string.") do |args|

            require 'digest/sha256'

            Digest::SHA256.hexdigest(args[0])
end
