require 'puppet_x'
module PuppetX::NetdevStdlib
  # Helper function to check if we should load the resource_api
  class Check
    def self.use_old_netdev_type
      use_old_netdev = false
      # is this an agent running on a network device, there are only a few of them
      use_old_netdev = %w[aristaeos ios_xr nexus].include? Facter.value('operatingsystem').downcase
      use_old_netdev
    end
  end
end
