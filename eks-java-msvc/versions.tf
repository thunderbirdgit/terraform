terraform {
	required_version = ">=1.0.0"

	required_providers {
		aws = {
			source = "hashicorp/aws"
			version = ">=4.47"
		}
		kubernetes = {
			source = "hashicorp/kubernetes"
			version = ">=2.20"
		}
		helm = {
			source = "hashicorp/helm"
			version = ">=2.9"
		}
	}
}

