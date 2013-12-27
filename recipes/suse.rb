#
# Cookbook Name:: workstation
# Recipe:: suse
#
# Copyright 2013, Thomas Boerger
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe "homeshick"
include_recipe "sshkey"
include_recipe "sudo"
include_recipe "zypper"

zypper_repository "suse-ca" do
  uri "http://download.suse.de/ibs/SUSE:/CA/openSUSE_12.2/"
  key "http://download.suse.de/ibs/SUSE:/CA/openSUSE_12.2/repodata/repomd.xml.key"
  title "SUSE Internal CA Certificate"

  action :add
end

node["workstation"]["suse"]["packages"].each do |name|
  package name do
    action :install
  end
end

homeshick "root" do
  keys node["workstation"]["suse"]["castles"]

  only_if do
    node["workstation"]["suse"]["castles"]
  end
end

sshkey "root" do
  keys node["workstation"]["suse"]["sshkeys"]

  only_if do
    node["workstation"]["suse"]["sshkeys"]
  end
end

homeshick node["workstation"]["suse"]["username"] do
  keys node["workstation"]["suse"]["castles"]
  group node["workstation"]["suse"]["group"]
  home "/home/#{node["workstation"]["suse"]["username"]}"

  only_if do
    node["workstation"]["suse"]["castles"]
  end
end

sshkey node["workstation"]["suse"]["username"] do
  keys node["workstation"]["suse"]["sshkeys"]
  group node["workstation"]["suse"]["group"]
  home "/home/#{node["workstation"]["suse"]["username"]}"

  only_if do
    node["workstation"]["suse"]["sshkeys"]
  end
end

sudo node["workstation"]["suse"]["username"] do
  passwordless true
end

node["workstation"]["suse"]["repositories"].each do |repo, name|
  execute "suse_clone_#{repo}" do
    command "git clone --recursive #{repo} #{name}"

    user node["workstation"]["suse"]["username"]
    group node["workstation"]["suse"]["group"]

    environment(
      "HOME" => "/home/#{node["workstation"]["suse"]["username"]}"
    )

    not_if do 
      ::File.directory? name
    end
  end
end

node["workstation"]["suse"]["symlinks"].each do |source, destination|
  link destination do
    to source

    only_if do
      ::File.exists? source
    end
  end
end

remote_file "/usr/local/bin/pastebin" do
  source "http://pastebin.suse.de/paste.pl"
  checksum "c654a304fdf297549af923a70229dd65"
  mode 0755

  action :create
end

remote_file "/usr/local/bin/imagebin" do
  source "http://imagebin.suse.de/imageupload.sh"
  checksum "4933825ed1e2edaabc5a1b149f5ac224"
  mode 0755

  action :create
end
