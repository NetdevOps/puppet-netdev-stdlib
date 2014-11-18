# encoding: utf-8

Puppet::Type.newtype(:network_dns) do
  @doc = 'Configure DNS name resolution on the target device'

  ensurable

  newparam(:domain, namevar: true) do
    desc 'DNS domain name, e.g. localdomain'

    validate do |value|
      if value.is_a? String then super(value)
      else fail "value #{value.inspect} is invalid, must be a String."
      end
    end
  end

  newproperty(:servers, array_matching: :all) do
    desc 'DNS servers to resolve names against'

    validate do |value|
      if value.is_a? String then super(value)
      else fail "value #{value.inspect} is invalid, must be a String."
      end
    end

    def should_to_s(new_value=@should)
      self.class.format_value_for_display(new_value)
    end

    def is_to_s(current_value=@is)
      self.class.format_value_for_display(current_value)
    end
  end

  newproperty(:search, array_matching: :all) do
    desc 'Array of DNS domains to search'

    validate do |value|
      if value.is_a? String then super(value)
      else fail "value #{value.inspect} is invalid, must be a String."
      end
    end

    def should_to_s(new_value=@should)
      self.class.format_value_for_display(new_value)
    end

    def is_to_s(current_value=@is)
      self.class.format_value_for_display(current_value)
    end
  end
end
