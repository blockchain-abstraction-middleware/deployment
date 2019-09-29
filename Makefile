deploy: 
	terraform init \
		-backend-config="conn_str=$$PG_URI" \
	./deployments/deployment

	$(eval workspace=$(shell terraform workspace new go-apis ./deployments/deployment))

	terraform workspace select go-apis ./deployments/deployment
	terraform apply -auto-approve ./deployments/deployment

destroy:
	terraform init ./deployments/deployment
	terraform destroy -force ./deployments/deployment

.PHONY: \
	deploy \
	destroy \