# Advanced Example

This example illustrates how to use the cloud-nat module.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| nat\_addresses | The self\_link of GCP Addresses to associate with the NAT | `list(string)` | `[]` | no |
| project\_id | The project ID to deploy to | `any` | n/a | yes |
| region | The region to deploy to | `any` | n/a | yes |
| router\_name | The name of the GCP Router to associate the NAT to | `any` | n/a | yes |
| source\_subnetwork\_ip\_ranges\_to\_nat | (Optional) Defaults to ALL\_SUBNETWORKS\_ALL\_IP\_RANGES. How NAT should be configured per Subnetwork. Valid values include: ALL\_SUBNETWORKS\_ALL\_IP\_RANGES, ALL\_SUBNETWORKS\_ALL\_PRIMARY\_IP\_RANGES, LIST\_OF\_SUBNETWORKS. Changing this forces a new NAT to be created. | `string` | `"ALL_SUBNETWORKS_ALL_IP_RANGES"` | no |
| subnetworks | n/a | <pre>list(object({<br>    name                     = string,<br>    source_ip_ranges_to_nat  = list(string)<br>    secondary_ip_range_names = list(string)<br>  }))</pre> | `[]` | no |

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
