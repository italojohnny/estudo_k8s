ping:
	@ansible-playbook playbooks/ping.yml

install:
	@ansible-playbook playbooks/install_k8s.yml
