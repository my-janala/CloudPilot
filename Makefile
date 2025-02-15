NAMESPACE = crossplane-system
CLUSTER_NAME = cloudpilot-cluster

.PHONY: all apply clean

all: apply

apply:
	@echo "Creating EKS cluster..."
	eksctl create cluster -f cluster.yaml
	@echo "Installing AWS Provider for Crossplane..."
	kubectl apply -f config/aws-provider.yaml
	@echo "Deploying Composite Resource Definition..."
	kubectl apply -f xrd/composite-database.yaml
	@echo "Deploying Composition for RDS..."
	kubectl apply -f composition/composition-rds.yaml
	@echo "Creating Database Claim..."
	kubectl apply -f claims/create-database.yaml
	@echo "Deploying Humanitec Agent..."
	kubectl apply -f humanitec/humanitec-agent.yaml

clean:
	@echo "Deleting Humanitec Agent..."
	kubectl delete -f humanitec/humanitec-agent.yaml
	@echo "Deleting Database Claim..."
	kubectl delete -f claims/create-database.yaml
	@echo "Deleting Composition for RDS..."
	kubectl delete -f composition/composition-rds.yaml
	@echo "Deleting Composite Resource Definition..."
	kubectl delete -f xrd/composite-database.yaml
	@echo "Deleting AWS Provider config..."
	kubectl delete -f config/aws-provider.yaml
	@echo "Deleting EKS Cluster..."
	eksctl delete cluster --name $(CLUSTER_NAME)