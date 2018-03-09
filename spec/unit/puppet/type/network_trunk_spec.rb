# encoding: utf-8

require 'spec_helper'

describe Puppet::Type.type(:network_trunk) do
  let(:catalog) { Puppet::Resource::Catalog.new }
  let(:type) { described_class.new(name: 'emanon', catalog: catalog) }

  it_behaves_like 'an ensurable type'
  it_behaves_like 'name is the namevar'

  describe 'encapsulation' do
    subject { described_class.attrclass(attribute) }

    let(:attribute) { :encapsulation }

    include_examples '#doc Documentation'
    include_examples 'rejected parameter values'
    include_examples 'accepts values', %w[dot1q isl negotiate none]
    include_examples 'rejected parameter values'
  end

  describe 'mode' do
    subject { described_class.attrclass(attribute) }

    let(:attribute) { :mode }

    include_examples '#doc Documentation'
    values = %w[access trunk dynamic_auto dynamic_desirable]
    include_examples 'accepts values', values
    include_examples 'rejected parameter values'
  end

  describe 'untagged_vlan' do
    subject { described_class.attrclass(attribute) }

    let(:attribute) { :untagged_vlan }

    include_examples '#doc Documentation'
    include_examples 'vlan id value'
  end

  describe 'tagged_vlans' do
    subject { described_class.attrclass(attribute) }

    let(:attribute) { :tagged_vlans }

    include_examples '#doc Documentation'
    include_examples 'vlan range value'
  end

  describe 'pruned_vlans' do
    subject { described_class.attrclass(attribute) }

    let(:attribute) { :pruned_vlans }

    include_examples '#doc Documentation'
    include_examples 'vlan range value'
  end
end
