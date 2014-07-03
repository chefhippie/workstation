#
# Cookbook Name:: workstation
# Attributes:: suse
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

default["workstation"]["suse"]["packages"] = %w(
  iwidgets
  tk
  ca-certificates-suse
  yakuake
  nvidia-computeG03
)

default["workstation"]["suse"]["username"] = "tboerger"
default["workstation"]["suse"]["group"] = "suse"

default["workstation"]["suse"]["castles"] = {
  "tboerger-base" => "tboerger/homeshick-base",
  "tboerger-linux" => "tboerger/homeshick-linux"
}

default["workstation"]["suse"]["sshkeys"] =  {
  "tboerger@homemac.local" => "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDUuitFc7ybzeUVAqiolJczD2g0wARkfrOxlxUEvdfGP1M7DA6tvDnALmTD3q7TVqlbhIS7B64DAU9nZ6RhDHD83dOco/xOGm9BG/TRnoKzyNU7HoCRfZg2TZNE0SiOR6ckbJuWa63t+et0hesMa49/7+zN0FH1UKqQZYMNkKz0I4Lz5/L49SkwgM/+cxIZCt0oC7mf+OGpImqo1OCAQHC9pPy25R1nTvFbLNmcGw5uK5VqIBPpCzYmFcKh708b9U/G+w7gQa3HQg5hCsNXL3SIL5vMnLWE/k2Q3YVTj4CvX9Yi/caQCkfXeNlmhYyEh98kbx5SRH97mtr3Dvo5lUo3",
  "tboerger@schleppmac.local" => "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCc1nE4kCs9WXEEbotF+0Rivnr/9I0fc56QLZTqIr4Rsl3iZcvVDgYJmh6rPcl9xKBptNo/jK1EJF/bm2APf6wIU5Q7tNjeIw5IMJnBRBfPdQujXumb1LZMGnQvPT/gHdpVZvPkYlKkBocOJGPG99GZL0FlXXpc4eDYrgCMfCzRFG1SbQWcUdipbJJgELmbiOy7c5eHtb9i51x7g99pC91WnpInuN4pa0AFHwDQpBhS8RSLFEAfWNNs4T3SiYiUUq0lIHBoIoTM8fTTzhshXAlGWuwsZ9c9luEAw+n4QL8oD9a2ycWTJ3JCRK3CC/+J2MqCROSL4zpVA7+PFrloScMV",
  "tboerger@freya.suse.de" => "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC1vlBRSgKE2LN6Tbp5pQ4qVVOXlqUnhI4fkEJLCGAGmsQGu5usxNvp9UJq0cGt6Sq1htoDmgIjEZwCE/np8/O7ZQPyHpwOWtUlS4WWiXKW0GYaeoYsuMabMLbuV1CpSZhb93zy7ZLIKUYpP7WHyZmivDaXnYkn2IOu3fvDtTQdXbwlCer96dIQjNE/KEH4/gUXetrLMYYg26gUnSDeHaxGrLQAfA9jNG1EbXiUkx8cFmZLEREHjwkBAHcwZDkqbLvZr+ExAKIVUcSzj1ep5sOrtSpbwxRtmDscviFPruJmsx/Jjl9fMhpZq8lIQb6aQ0qq09KGv1WP4YbLGRItvq9T",
  "tboerger@mimir.suse.de" => "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCjASyOuvhSdzOeJCC/9crxcuztTY/AeFV7v59wQrCwozS2hPBcy5UJ4li80ly79t2D/ppCsiGDQjxCpMUKq++canqCIRZ1d6/6ylQPZIQw0rCGRHXDIKlc99i3Fz94XD85ZtFdGe2TWq1T2EEgmCRM9dGWq+f5iloRxnoSrCTXpy8JshnO5kMyQovChKzLBKdHIxddBDlEHxvWI0UcvWNuA8J2nrrOfMdMVKdPa5xeveX2V5oW3YClku7b/W6jO1rdkZ0tyl1n+wbETGmWQC+V4HE5qxK0u+Zmyz/4J+82sKQC6uEWbC9dFRslq+84rd4LyCD2467ZmzzV6HcyWJhL"
}

default["workstation"]["suse"]["repositories"] =  {
  "git@github.com:SUSE/cloud.git" => "/home/#{node["workstation"]["suse"]["username"]}/Projects/cloud/docs",
  "git@github.com:SUSE-Cloud/automation.git" => "/home/#{node["workstation"]["suse"]["username"]}/Projects/cloud/automation",
  
  "git@github.com:tboerger/workstation.git" => "/home/#{node["workstation"]["suse"]["username"]}/Projects/chef/workstation",
  "git@github.com:tboerger/cookbooks.git" => "/home/#{node["workstation"]["suse"]["username"]}/Projects/chef/cookbooks",
  "git@github.com:tboerger/homeshick-base.git" => "/home/#{node["workstation"]["suse"]["username"]}/Projects/misc/homeshick-base",
  "git@github.com:tboerger/homeshick-linux.git" => "/home/#{node["workstation"]["suse"]["username"]}/Projects/misc/homeshick-linux",
  
  "https://github.com/aspiers/git-config" => "/home/#{node["workstation"]["suse"]["username"]}/Projects/misc/git-config"
}

default["workstation"]["suse"]["symlinks"] = {
  "/home/#{node["workstation"]["suse"]["username"]}/Projects/cloud/docs/dev-setup/sync-repos" => "/usr/local/bin/sync-suse-repos",
  "/home/#{node["workstation"]["suse"]["username"]}/Projects/cloud/automation/scripts/jenkins/track-upstream-and-package.pl" => "/usr/local/bin/track-upstream-and-package",
  "/home/#{node["workstation"]["suse"]["username"]}/Projects/misc/git-config/bin/git-add-prefix" => "/usr/local/bin/git-add-prefix",
  "/home/#{node["workstation"]["suse"]["username"]}/Projects/misc/git-config/bin/git-cherry-menu" => "/usr/local/bin/git-cherry-menu",
  "/home/#{node["workstation"]["suse"]["username"]}/Projects/misc/git-config/bin/git-compare-upstream" => "/usr/local/bin/git-compare-upstream",
  "/home/#{node["workstation"]["suse"]["username"]}/Projects/misc/git-config/bin/git-head" => "/usr/local/bin/git-head",
  "/home/#{node["workstation"]["suse"]["username"]}/Projects/misc/git-config/bin/git-icing" => "/usr/local/bin/git-icing",
  "/home/#{node["workstation"]["suse"]["username"]}/Projects/misc/git-config/bin/git-ls-dir" => "/usr/local/bin/git-ls-dir",
  "/home/#{node["workstation"]["suse"]["username"]}/Projects/misc/git-config/bin/git-merged" => "/usr/local/bin/git-merged",
  "/home/#{node["workstation"]["suse"]["username"]}/Projects/misc/git-config/bin/git-prefix" => "/usr/local/bin/git-prefix",
  "/home/#{node["workstation"]["suse"]["username"]}/Projects/misc/git-config/bin/git-root" => "/usr/local/bin/git-root",
  "/home/#{node["workstation"]["suse"]["username"]}/Projects/misc/git-config/bin/git-set-upstream" => "/usr/local/bin/git-set-upstream",
  "/home/#{node["workstation"]["suse"]["username"]}/Projects/misc/git-config/bin/git-sync-upstream" => "/usr/local/bin/git-sync-upstream",
  "/home/#{node["workstation"]["suse"]["username"]}/Projects/misc/git-config/bin/git-upstream" => "/usr/local/bin/git-upstream",
  "/home/#{node["workstation"]["suse"]["username"]}/Projects/misc/git-config/bin/git-url-rewrite" => "/usr/local/bin/git-url-rewrite",
  "/home/#{node["workstation"]["suse"]["username"]}/Projects/misc/git-config/bin/git-wip" => "/usr/local/bin/git-wip"
}
