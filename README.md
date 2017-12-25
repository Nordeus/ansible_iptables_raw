# iptables_raw
Module for Ansible which makes it easy to manage `iptables` and it keeps state.

### Documentation
 * [Module documentation](https://nordeus.github.io/ansible-custom-modules/iptables_raw.html)
 * [Managing Iptables with Ansible the Easy Way](https://nordeus.com/blog/engineering/managing-iptables-with-ansible-the-easy-way/) blog post

### Installation
To use the `iptables_raw` module just copy the file into `./library`, alongside your top level playbooks, or copy it into the path specified by `ANSIBLE_LIBRARY` or the `--module-path` command line option.

### Examples

```yml
# Allow all IPv4 traffic coming in on port 80 (http)
- iptables_raw:
    name: allow_tcp_80
    rules: '-A INPUT -p tcp -m tcp --dport 80 -j ACCEPT'

# Set default rules with weight 10 and disregard all unmanaged rules
- iptables_raw:
    name: default_rules
    weight: 10
    keep_unmanaged: no
    rules: |
      -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
      -A INPUT -i lo -j ACCEPT
      -A INPUT -p tcp -m state --state NEW -m tcp --dport 22 -j ACCEPT
      -P INPUT DROP
      -P FORWARD DROP
      -P OUTPUT ACCEPT

# Allow all IPv6 traffic coming in on port 443 (https) with weight 50
- iptables_raw:
    ipversion: 6
    weight: 50
    name: allow_tcp_443
    rules: '-A INPUT -p tcp -m tcp --dport 443 -j ACCEPT'

# Remove the above rule
- iptables_raw:
    state: absent
    ipversion: 6
    name: allow_tcp_443

# Define rules with a custom chain
- iptables_raw:
    name: custom1_rules
    rules: |
      -N CUSTOM1
      -A CUSTOM1 -s 192.168.0.0/24 -j ACCEPT

# Reset all IPv4 iptables rules in all tables and allow all traffic
- iptables_raw:
    name: '*'
    table: '*'
    state: absent
```
