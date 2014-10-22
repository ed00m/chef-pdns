require 'spec_helper'

describe "powerdns" do
  if ['debian', 'ubuntu'].include?(os[:family])
    describe package('pdns-server') do
      it { should be_installed }
    end
  elsif os[:family] == 'redhat'
    describe package('pdns') do
      it { should be_installed }
    end
  end

  describe package('pdns-backend-mysql') do
    it { should be_installed }
  end

  describe service('pdns') do
    it { should be_enabled }
    it { should be_running }
  end

  describe port(53) do
    it { should be_listening }
  end

  if ['debian', 'ubuntu'].include?(os[:family])
    describe file('/etc/powerdns/pdns.conf') do
      it { should be_file }
      it { should contain 'gmysql-host=' }
      it { should contain 'gmysql-user=' }
      it { should contain 'gmysql-password=' }
      it { should contain 'mysql-dbname=' }
    end
  elsif os[:family] == 'redhat'
    describe file('/etc/pdns/pdns.conf') do
      it { should be_file }
      it { should contain 'gmysql-host=' }
      it { should contain 'gmysql-user=' }
      it { should contain 'gmysql-password=' }
      it { should contain 'mysql-dbname=' }
    end
  end

  if ['debian', 'ubuntu'].include?(os[:family])
    describe file('/etc/powerdns/pdns.d') do
      it { should_not be_directory }
    end
  elsif os[:family] == 'redhat'
    describe file('/etc/pdns/pdns.d') do
      it { should_not be_directory }
    end
  end
end
