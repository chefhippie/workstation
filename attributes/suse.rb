#
# Cookbook Name:: workstation
# Attributes:: suse
#
# Copyright 2013-2014, Thomas Boerger <thomas@webhippie.de>
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

repo = case node["platform_version"]
when /\A13\.\d+\z/
  "openSUSE_#{node["platform_version"]}"
when /\A42\.\d+\z/
  "openSUSE_Leap_#{node["platform_version"]}"
when /\A\d{8}\z/
  "openSUSE_Tumbleweed"
else
  raise "Unsupported SUSE version"
end

default["workstation"]["suse"]["username"] = "tboerger"
default["workstation"]["suse"]["group"] = "suse"

default["workstation"]["suse"]["packages"] = %w(
  iwidgets
  tk
  ca-certificates-suse
  pinentry-gtk2
)

default["workstation"]["suse"]["repos"] = [{
  "name" => "suse-ca",
  "uri" => "http://download.suse.de/ibs/SUSE:/CA/#{repo}/",
  "key" => "http://download.suse.de/ibs/SUSE:/CA/#{repo}/repodata/repomd.xml.key",
  "title" => "SUSE Internal CA Certificate"
}]

default["workstation"]["suse"]["castles"] = {
  "tboerger-base" => "tboerger/homeshick-base",
  "tboerger-linux" => "tboerger/homeshick-linux",
  "tboerger-suse" => "tboerger/homeshick-suse"
}

default["workstation"]["suse"]["sshkeys"] =  {
  "tboerger@loki.webhippie.de" => "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCc1nE4kCs9WXEEbotF+0Rivnr/9I0fc56QLZTqIr4Rsl3iZcvVDgYJmh6rPcl9xKBptNo/jK1EJF/bm2APf6wIU5Q7tNjeIw5IMJnBRBfPdQujXumb1LZMGnQvPT/gHdpVZvPkYlKkBocOJGPG99GZL0FlXXpc4eDYrgCMfCzRFG1SbQWcUdipbJJgELmbiOy7c5eHtb9i51x7g99pC91WnpInuN4pa0AFHwDQpBhS8RSLFEAfWNNs4T3SiYiUUq0lIHBoIoTM8fTTzhshXAlGWuwsZ9c9luEAw+n4QL8oD9a2ycWTJ3JCRK3CC/+J2MqCROSL4zpVA7+PFrloScMV",
  "tboerger@freya.suse.de" => "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC1vlBRSgKE2LN6Tbp5pQ4qVVOXlqUnhI4fkEJLCGAGmsQGu5usxNvp9UJq0cGt6Sq1htoDmgIjEZwCE/np8/O7ZQPyHpwOWtUlS4WWiXKW0GYaeoYsuMabMLbuV1CpSZhb93zy7ZLIKUYpP7WHyZmivDaXnYkn2IOu3fvDtTQdXbwlCer96dIQjNE/KEH4/gUXetrLMYYg26gUnSDeHaxGrLQAfA9jNG1EbXiUkx8cFmZLEREHjwkBAHcwZDkqbLvZr+ExAKIVUcSzj1ep5sOrtSpbwxRtmDscviFPruJmsx/Jjl9fMhpZq8lIQb6aQ0qq09KGv1WP4YbLGRItvq9T",
  "tboerger@mimir.suse.de" => "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCjASyOuvhSdzOeJCC/9crxcuztTY/AeFV7v59wQrCwozS2hPBcy5UJ4li80ly79t2D/ppCsiGDQjxCpMUKq++canqCIRZ1d6/6ylQPZIQw0rCGRHXDIKlc99i3Fz94XD85ZtFdGe2TWq1T2EEgmCRM9dGWq+f5iloRxnoSrCTXpy8JshnO5kMyQovChKzLBKdHIxddBDlEHxvWI0UcvWNuA8J2nrrOfMdMVKdPa5xeveX2V5oW3YClku7b/W6jO1rdkZ0tyl1n+wbETGmWQC+V4HE5qxK0u+Zmyz/4J+82sKQC6uEWbC9dFRslq+84rd4LyCD2467ZmzzV6HcyWJhL"
}

default["workstation"]["suse"]["repositories"] =  {
  "git@github.com:SUSE/cloud.git" => "/home/#{node["workstation"]["suse"]["username"]}/Projects/cloud/docs",
  "git@github.com:SUSE-Cloud/automation.git" => "/home/#{node["workstation"]["suse"]["username"]}/Projects/cloud/automation",

  "git@github.com:tboerger/workstation.git" => "/home/#{node["workstation"]["suse"]["username"]}/Projects/chef/workstation",

  "git@github.com:tboerger/homeshick-base.git" => "/home/#{node["workstation"]["suse"]["username"]}/Projects/misc/homeshick-base",
  "git@github.com:tboerger/homeshick-linux.git" => "/home/#{node["workstation"]["suse"]["username"]}/Projects/misc/homeshick-linux",
  "git@github.com:tboerger/homeshick-vim.git" => "/home/#{node["workstation"]["suse"]["username"]}/Projects/misc/homeshick-vim",
  "git@github.com:tboerger/homeshick-suse.git" => "/home/#{node["workstation"]["suse"]["username"]}/Projects/misc/homeshick-suse"
}

default["workstation"]["suse"]["symlinks"] = {
  "/home/#{node["workstation"]["suse"]["username"]}/Projects/cloud/automation/scripts/jenkins/track-upstream-and-package.pl" => "/usr/local/bin/track-upstream-and-package",
  "/home/#{node["workstation"]["suse"]["username"]}/Projects/cloud/automation/scripts/mkcloud" => "/usr/local/bin/mkcloud",

  "/usr/bin/urxvt-256color" => "/usr/local/bin/urxvt"
}
