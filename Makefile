

create-template:
	packer build --var-file=../credentials.pkr.hcl ubuntu-server-22-10.pkr.hcl

deploy-servers:
	terraform init
	terraform apply --var-file=mila-ctrlr.tfvars -auto-approve 
	terraform apply --var-file=mila-node-1.tfvars -auto-approve 
	terraform apply --var-file=mila-node-2.tfvars -auto-approve 
	terraform apply --var-file=pisztel-node-1.tfvars -auto-approve 
