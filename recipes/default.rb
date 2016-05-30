#
# Cookbook Name:: gocd-agent
# Recipe:: default
#
# Copyright 2016, KAVERI
#
# All rights reserved - Do Not Redistribute
#
execute "yum update" do
 command "yum -y update"
end

template "/etc/yum.repos.d/docker.repo" do
 source "docker.repo.rb"
 owner "root"
 group "root"
 mode "0644"
end

template "/etc/yum.repos.d/gocd.repo" do
 source "gocd.repo.rb"
 owner "root"
 group "root"
 mode "0644"
end

package "java-1.8.0-openjdk" do
 action :install
end

package "docker-engine" do
 action :install
end

service "docker" do
 action [ :enable, :start ]
end

package "go-agent" do
 action :install
end

service "go-agent" do
 action [ :enable, :start ]
end

group 'docker' do
 action :modify
 members 'go'
 append true
end

service "go-agent" do
 action [ :restart ]
end

service "docker" do
 action [ :restart ]
end
