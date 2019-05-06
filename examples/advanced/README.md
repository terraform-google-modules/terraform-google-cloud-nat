# Advanced Example

This example illustrates how to use the cloud-nat module.

[^]: (autogen_docs_start)

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| project\_id | The project ID to deploy to | string | n/a | yes |
| region | The region to deploy to | string | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| name | The name of the Cloud NAT. |
| project\_id | The ID of the project in which resources are created. |
| region | The region in which resources are created. |
| router\_name | The name of the Cloud NAT router. |

[^]: (autogen_docs_end)

To provision this example, run the following from within this directory:

- `terraform init` to get the plugins
- `terraform plan` to see the infrastructure plan
- `terraform apply` to apply the infrastructure build
- `terraform destroy` to destroy the built infrastructure
