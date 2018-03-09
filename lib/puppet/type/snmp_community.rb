# encoding: utf-8

Puppet::Type.newtype(:snmp_community) do
  @doc = 'Manage the SNMP community'

  apply_to_all
  ensurable

  newparam(:name, namevar: true) do
    desc 'The name of the community, e.g. "public" or "private"'

    validate do |value|
      raise "value #{value.inspect} is invalid, must be a String." unless value.is_a? String
      super(value)
    end
  end

  newproperty(:group) do
    desc 'The SNMP group for this community'
    validate do |value|
      raise "value #{value.inspect} is invalid, must be a String." unless value.is_a? String
      super(value)
    end
  end

  newproperty(:acl) do
    desc 'The ACL name to associate with this community string'
    validate do |value|
      raise "value #{value.inspect} is invalid, must be a String." unless value.is_a? String
      super(value)
    end
  end
end
