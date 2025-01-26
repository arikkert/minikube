YAMLLINT=@if which yamllint > /dev/null; then yamllint $@.yml; fi
ANSIBLELINT=@if which ansible-lint > /dev/null; then ansible-lint -q $@.yml; fi
GITLEAKS=@if which gitleaks > /dev/null; then gitleaks detect . --verbose ; fi
OPTIONS=--diff #--check
PLAYBOOK=ansible-playbook $(OPTIONS) $@.yml

all: main

main reinstall:
	$(YAMLLINT)
	$(ANSIBLELINT)
	$(PLAYBOOK)

test:
	ssh minikube echo "minikube status" \| sudo su - kube
	ssh minikube echo "minikube version" \| sudo su - kube
	ssh minikube echo "minikube update-check" \| sudo su - kube
	ssh minikube echo "kubectl version" \| sudo su - kube
	ssh minikube echo "kubectl get all" \| sudo su - kube
	ssh minikube echo minikube ssh docker ps \| sudo su - kube

reboot:
	ssh minikube sudo systemctl stop dashboard
	ssh minikube sudo systemctl stop minikube
	ssh minikube sudo $@

status:
	ssh minikube sudo systemctl $@ minikube
	ssh minikube sudo systemctl $@ dashboard

gitleaks:
	$(GITLEAKS)
