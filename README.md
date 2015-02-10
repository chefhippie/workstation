workstation Cookbook
====================


Note
----

You've got to execute a single command manually. After a successfull
chef run you've got to execute this command to get NIS inhouse enabled:

```
yast nis enable domain=suse.de server=10.160.0.1 automounter=yes
```
