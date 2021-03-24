# Basic Example

This example illustrates how to use the cloud-nat module.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| project\_id | The project ID to deploy to | `any` | n/a | yes |
| region | The region to deploy to | `any` | n/a | yes |
| router\_name | The name of the GCP Router to associate the NAT to | `any` | n/a | yes |

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
