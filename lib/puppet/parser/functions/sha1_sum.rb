Puppet::Parser::Functions::newfunction(:sha1_sum, :type => :rvalue,
        :doc => "Returns a SHA1 hash value from a provided string.") do |args|

            require 'digest/sha1'

            Digest::SHA1.hexdigest(args[0])
end
