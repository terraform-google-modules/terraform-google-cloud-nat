# Cloud NAT with Compute Engine example

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| network | The VPC network self link | `any` | n/a | yes |
| project\_id | The project ID to deploy to | `any` | n/a | yes |
| subnet | The subnet self link | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| name | The name of the created Cloud NAT instance |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

To provision this example, run the following from within this directory:

- `terraform init` to get the plugins
- `terraform plan` to see the infrastructure plan
- `terraform apply` to apply the infrastructure build
- `terraform destroy` to destroy the built infrastructure
