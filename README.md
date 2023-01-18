<!-- BEGIN_TF_DOCS -->
[![Geek Cell GmbH](https://raw.githubusercontent.com/geekcell/template-terraform-module/main/docs/assets/logo.svg)](https://www.geekcell.io/)

### Code Quality
[![License](https://img.shields.io/github/license/geekcell/terraform-aws-ecr-repository)](https://github.com/geekcell/terraform-aws-ecr-repository/blob/master/LICENSE)
[![GitHub release (latest tag)](https://img.shields.io/github/v/release/geekcell/terraform-aws-ecr-repository?logo=github&sort=semver)](https://github.com/geekcell/terraform-aws-ecr-repository/releases)
[![Release](https://github.com/geekcell/terraform-aws-ecr-repository/actions/workflows/release.yaml/badge.svg)](https://github.com/geekcell/terraform-aws-ecr-repository/actions/workflows/release.yaml)
[![Validate](https://github.com/geekcell/terraform-aws-ecr-repository/actions/workflows/validate.yaml/badge.svg)](https://github.com/geekcell/terraform-aws-ecr-repository/actions/workflows/validate.yaml)
[![Lint](https://github.com/geekcell/terraform-aws-ecr-repository/actions/workflows/linter.yaml/badge.svg)](https://github.com/geekcell/terraform-aws-ecr-repository/actions/workflows/linter.yaml)

### Security
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-ecr-repository/general)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-ecr-repository&benchmark=INFRASTRUCTURE+SECURITY)

#### Cloud
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-ecr-repository/cis_aws)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-ecr-repository&benchmark=CIS+AWS+V1.2)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-ecr-repository/cis_aws_13)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-ecr-repository&benchmark=CIS+AWS+V1.3)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-ecr-repository/cis_azure)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-ecr-repository&benchmark=CIS+AZURE+V1.1)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-ecr-repository/cis_azure_13)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-ecr-repository&benchmark=CIS+AZURE+V1.3)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-ecr-repository/cis_gcp)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-ecr-repository&benchmark=CIS+GCP+V1.1)

##### Container
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-ecr-repository/cis_kubernetes_16)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-ecr-repository&benchmark=CIS+KUBERNETES+V1.6)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-ecr-repository/cis_eks_11)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-ecr-repository&benchmark=CIS+EKS+V1.1)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-ecr-repository/cis_gke_11)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-ecr-repository&benchmark=CIS+GKE+V1.1)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-ecr-repository/cis_kubernetes)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-ecr-repository&benchmark=CIS+KUBERNETES+V1.5)

#### Data protection
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-ecr-repository/soc2)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-ecr-repository&benchmark=SOC2)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-ecr-repository/pci)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-ecr-repository&benchmark=PCI-DSS+V3.2)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-ecr-repository/pci_dss_v321)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-ecr-repository&benchmark=PCI-DSS+V3.2.1)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-ecr-repository/iso)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-ecr-repository&benchmark=ISO27001)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-ecr-repository/nist)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-ecr-repository&benchmark=NIST-800-53)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-ecr-repository/hipaa)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-ecr-repository&benchmark=HIPAA)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-ecr-repository/fedramp_moderate)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-ecr-repository&benchmark=FEDRAMP+%28MODERATE%29)

# Terraform AWS ECR Repository Module

Module to create an AWS ECR repository with lifecycle policies.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_force_delete"></a> [force\_delete](#input\_force\_delete) | Delete the repository even if it contains images. | `bool` | `false` | no |
| <a name="input_image_tag_mutability"></a> [image\_tag\_mutability](#input\_image\_tag\_mutability) | The tag mutability setting for the repository. | `string` | `"MUTABLE"` | no |
| <a name="input_lifecycle_rules"></a> [lifecycle\_rules](#input\_lifecycle\_rules) | Lifecycle policy rules for expiring images. | <pre>list(object({<br>    description  = optional(string)<br>    tag_status   = optional(string)<br>    count_type   = string<br>    count_unit   = string<br>    count_number = number<br>  }))</pre> | <pre>[<br>  {<br>    "count_number": 10,<br>    "count_type": "sinceImagePushed",<br>    "count_unit": "days",<br>    "description": "Expire untagged images older than 10 days",<br>    "tag_status": "untagged"<br>  },<br>  {<br>    "count_number": 60,<br>    "count_type": "sinceImagePushed",<br>    "count_unit": "days",<br>    "description": "Expire images older than 60 days",<br>    "tag_status": "any"<br>  }<br>]</pre> | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the ECR repository. | `string` | n/a | yes |
| <a name="input_policy"></a> [policy](#input\_policy) | Repository policy document in JSON format. | `string` | `null` | no |
| <a name="input_scan_on_push"></a> [scan\_on\_push](#input\_scan\_on\_push) | Indicates whether images are scanned after being pushed to the repository. | `bool` | `true` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to add to the ECR repository. | `map(any)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | The ARN of the repository. |
| <a name="output_name"></a> [name](#output\_name) | The name of the repository. |
| <a name="output_url"></a> [url](#output\_url) | The URL of the repository (in the form aws\_account\_id.dkr.ecr.region.amazonaws.com/repositoryName). |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.36 |

## Resources

- resource.aws_ecr_lifecycle_policy.main (main.tf#25)
- resource.aws_ecr_repository.main (main.tf#6)
- resource.aws_ecr_repository_policy.main (main.tf#18)

# Examples
### Full
```hcl
module "example" {
  source = "../../"

  name = "my-repository"
}
```
<!-- END_TF_DOCS -->
