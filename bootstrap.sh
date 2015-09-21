#!/bin/bash
# time to bootstrap our box!!

#First let's check if the boot strap has already run.
if [ -f /home/vagrant/.bootstrap_run ];
then
#Let the user know that the bootstrap has run since youve provisioned this box.
	echo "Bootstrap has already run...skipping script"
else 
#If not, we will kick off these few commands to bootstrap our box with node.js
#Let the user know that the script is starting

	echo "########################"
	echo "########################"
	echo "########################"
	echo "Bootstrap is starting..."
	echo "########################"
	echo "########################"
	echo "########################"
#Install Vim...cause duh.
	sudo yum install vim -y
#Install the Repository "EPEL" which hosts extra packages such as node, etc. 
	sudo yum install epel-release -y
#Install npm, (node package manager) and enable teh new repo
	sudo yum install npm -y --enablerepo=epel
# Time to install node package "Forever" (used to keep our child process running even if it fails or goes down)
	sudo npm install -g hubot coffee-script yo generator-hubot forever
#Turn off those damn Iptables
	sudo chkconfig iptables off	
	sudo service iptables stop
#Touch the bootstrap flag file...this will help the initial script understand if the bootstrap has run already
#Could we use a variable to do this...yep...but we ain't.
	sudo touch /home/vagrant/.bootstrap_run
fi
