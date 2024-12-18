playbook documentation
======================

Playbooks to install and configure minikube on *AlmaLinux 9* hosts
(tested on Vagrant box https://portal.cloud.hashicorp.com/vagrant/discover/almalinux/9)

It will:
- check if the hosts fullfill the prereq
- install latest stable kubectl
- install latest minikube
- install minikube user *kube* to run the minikube app
- configure sudo for *kube* user
- configure and run minikube and dashboard service
- install haproxy to make dashboard accessible from outside
- do some more useful stuff  


Info
----

This implementation uses a Makefile as installation wrapper.  
Just type **make** in the directory where the Makefile is located, to install all dependencies and run the playbook.
The makefile calls tools like **yamllint** and **ansible-lint**.
These tools are only called when found in the search path, so no problem if they are not installed.

Requirements
------------

Deploy host has **make**, **ansible** and **ansible-galaxy** installed.
Target hosts has *RedHat 9* installed.
Requires root access to target hosts.

Variables
---------

Ansible inventory containing definitions for
3 clusters each with 1 control node and 2 worker nodes.
The playbooks only refer to the group names and never tot the individual hosts (*bla.mydomain*) so you can choose your own names for the actual hostnames.

    [minikube]
    minikube.mydomain

Testing
-------

Run:

    make test

Dependencies
------------

License
-------

BSD

Author Information
------------------

    ARK-ICT
    Andre Rikkert de Koe - ICT
