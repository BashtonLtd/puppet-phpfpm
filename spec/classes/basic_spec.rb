require 'spec_helper'

describe 'phpfpm' do
  context 'supported operating systems' do
    ['RedHat'].each do |osfamily|
      describe "phpfpm class without any parameters on #{osfamily}" do
        let(:params) {{ }}
        let(:facts) {{
          :osfamily => osfamily,
        }}

        it { should compile.with_all_deps }
        it { should contain_class('phpfpm::params') }
        it { should contain_class('phpfpm::install').that_comes_before('Class[phpfpm::config]') }
        it { should contain_class('phpfpm::config') }
        it { should contain_class('phpfpm::service') }

        it { should contain_package('php-fpm') }
        it { should contain_service('php-fpm') }
      it { should contain_file('/etc/php-fpm.d/www.conf') }

      end
    end
  end

end
