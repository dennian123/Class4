#to automate the process(mostly for testing purposes)
#not make any mistakes on .tfstate file - overwritten(forget to workspace select, new...)
#simply seperating/having .tfstate file on each region(virginia,ohio...) in different virtual folders
virginia:  #name of the blok
	terraform workspace new virginia || terraform workspace select virginia
	terraform init
	terraform apply -var-file regions/virginia.tfvars --auto-approve

ohio: 
	terraform workspace new ohio || terraform workspace select ohio
	terraform init
	terraform apply -var-file regions/ohi.tfvars --auto-approve		

california:
	terraform workspace new california || terraform workspace select california
	terraform init
	terraform apply -var-file regions/california.tfvars --auto-approve

oregon:
	terraform workspace new oregon || terraform workspace select oregon
	terraform init
	terraform apply -var-file regions/oregon.tfvars --auto-approve	

# apply all(anyName EX: us-apply:) resources at once (spacifiy all names in single line)	
apply-all: virginia ohio california oregon	


virginia-destroy:  #name of the blok
	terraform workspace new virginia || terraform workspace select virginia
	terraform init
	terraform destroy -var-file regions/virginia.tfvars --auto-approve

ohio-destroy:
	terraform workspace new ohio || terraform workspace select ohio
	terraform init
	terraform destroy -var-file regions/ohi.tfvars --auto-approve		

california-destroy:
	terraform workspace new california || terraform workspace select california
	terraform init
	terraform destroy -var-file regions/california.tfvars --auto-approve

oregon-destroy:
	terraform workspace new oregon || terraform workspace select oregon
	terraform init
	terraform destroy -var-file regions/oregon.tfvars --auto-approve	

# destroy all(anyName EX: us-destroy:) resources at once (spacifiy all names in single line)	
destroy-all: virginia-destroy ohio-destroy california-destroy oregon-destroy		


