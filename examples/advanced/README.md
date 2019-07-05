# Advanced Example

This example illustrates how to use the cloud-nat module.

[^]: (autogen_docs_start)

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| nat\_addresses | The self_link of GCP Addresses to associate with the NAT | list | n/a | yes |
| project\_id | The project ID to deploy to | string | n/a | yes |
| region | The region to deploy to | string | n/a | yes |
| router\_name | The name of the GCP Router to associate the NAT to | string | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| name | The name of the created Cloud NAT instance |

[^]: (autogen_docs_end)

To provision this example, run the following from within this directory:

- `terraform init` to get the plugins
- `terraform plan` to see the infrastructure plan
- `terraform apply` to apply the infrastructure build
- `terraform destroy` to destroy the built infrastructure