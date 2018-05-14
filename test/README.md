How to Test
-----------

Currently two virtual machines are defined for vagrant:

* `debian`
  * Virtual machine with upstream Debian Jessie
* `centos`
  * Virtual machine with upstream Centos 7

Provisioning the machines (either via `vagrant up` or `vagrant provision`) will first check for and install a python-executable (neccessary for ansible) and then run the ansible playbook `iptables.yml`, saving one rule to accept all.

Additional provisioning runs can be executed with `vagrant provision`.

You can connect to a vm to manually debug with `vagrant ssh (debian|centos)`

After testing the VMs can be shutdown with `vagrant destroy -f`
