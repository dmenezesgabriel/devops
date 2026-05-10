.PHONY: clean-terraform

clean-terraform:
	find . -type d -name ".terraform" -prune -exec rm -rf {} +
	find . -type f \( -name "terraform.tfstate" -o -name "terraform.tfstate.backup" \) -delete
