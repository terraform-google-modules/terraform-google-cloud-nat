# Advanced Example

This example illustrates how to use the cloud-nat module.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| nat\_addresses | The self_link of GCP Addresses to associate with the NAT | list(string) | `<list>` | no |
| project\_id | The project ID to deploy to | string | n/a | yes |
| region | The region to deploy to | string | n/a | yes |
| router\_name | The name of the GCP Router to associate the NAT to | string | n/a | yes |
| source\_subnetwork\_ip\_ranges\_to\_nat | (Optional) Defaults to ALL_SUBNETWORKS_ALL_IP_RANGES. How NAT should be configured per Subnetwork. Valid values include: ALL_SUBNETWORKS_ALL_IP_RANGES, ALL_SUBNETWORKS_ALL_PRIMARY_IP_RANGES, LIST_OF_SUBNETWORKS. Changing this forces a new NAT to be created. | string | `"ALL_SUBNETWORKS_ALL_IP_RANGES"` | no |
| subnetworks |  | object | `<list>` | no |

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
