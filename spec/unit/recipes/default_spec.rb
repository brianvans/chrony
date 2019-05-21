#
# Cookbook:: chrony
# Spec:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

require 'spec_helper'

shared_examples 'rhel' do
  it 'templates chrony.conf' do
    expect(chef_run).to create_template('/etc/chrony.conf')
  end

  it 'enables chronyd' do
    expect(chef_run).to enable_service('chronyd')
  end
end

shared_examples 'debian' do
  it 'templates chrony.conf' do
    expect(chef_run).to create_template('/etc/chrony/chrony.conf')
  end

  it 'enables chrony' do
    expect(chef_run).to enable_service('chrony')
  end
end

describe 'chrony::default' do
  context 'When all attributes are default, on Ubuntu 16.04' do
    let(:chef_run) do
      # for a complete list of available platforms and versions see:
      # https://github.com/customink/fauxhai/blob/master/PLATFORMS.md
      runner = ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '16.04')
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it_behaves_like 'debian'
  end

  context 'When all attributes are default, on CentOS 7' do
    let(:chef_run) do
      # for a complete list of available platforms and versions see:
      # https://github.com/customink/fauxhai/blob/master/PLATFORMS.md
      runner = ChefSpec::ServerRunner.new(platform: 'centos', version: '7')
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it_behaves_like 'rhel'
  end

  context 'When all attributes are default, on Amazon Linux 2' do
    let(:chef_run) do
      # for a complete list of available platforms and versions see:
      # https://github.com/customink/fauxhai/blob/master/PLATFORMS.md
      runner = ChefSpec::ServerRunner.new(platform: 'amazon', version: '2')
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it_behaves_like 'rhel'
  end

  context 'When all attributes are default, on Fedora 29' do
    let(:chef_run) do
      # for a complete list of available platforms and versions see:
      # https://github.com/customink/fauxhai/blob/master/PLATFORMS.md
      runner = ChefSpec::ServerRunner.new(platform: 'fedora', version: '29')
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it_behaves_like 'rhel'
  end
end
