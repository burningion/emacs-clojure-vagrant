# fix issue with locales
include_recipe "main::fix_locale"

#apt_repository "emacs-snapshot" do
#  uri "https://launchpad.net/~cassou/+archive/emacs"
#  components ["main"]
#end

#%w{emacs git-core rlwrap openjdk-6-jdk tmux curl tree unzip}.each do |pkg|
#  package pkg do
#    action :install
#  end
#end

# postgresql server
include_recipe "postgresql::server"
include_recipe "postgresql::server_debian"
include_recipe "leiningen::default"

# override template from the postgresql cookbook
resources(:template => "#{node[:postgresql][:dir]}/pg_hba.conf").instance_exec do
	cookbook "main"
end


