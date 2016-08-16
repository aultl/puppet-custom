# Fact: jtvenv
#
# Purpose: Returns the jtv environment based on the hostname.
#
# Resolution: regex against the hostname fact to realize environment.
#

Facter.add(:jtvenv) do
  setcode do
    host = Facter.value(:hostname)

    case host[4,1]
      when 'c'
        jtvenv = 'stab'
      when 'd'
        jtvenv = 'dev'
      when 't'
        jtvenv = 'trn'
      when 'q'
        jtvenv = 'qa'
      else
        jtvenv = 'prod'
    end
  end
end

