deploy: 
	terraform init \
		-backend-config="conn_str=$$PG_URI" \
	./deployments/deployment

	$(eval workspace=$(shell terraform workspace new default))

	terraform workspace select default ./deployments/deployment
	terraform apply -auto-approve ./deployments/deployment

plan: 
	terraform init \
		-backend-config="conn_str=$$PG_URI" \
	./deployments/deployment

	$(eval workspace=$(shell terraform workspace new default))

	terraform workspace select default ./deployments/deployment
	terraform plan ./deployments/deployment

destroy:
	terraform init ./deployments/deployment
	terraform destroy -force ./deployments/deployment

.PHONY:\
	plan  \
	deploy \
	destroy \