# Basic Example

This example illustrates how to use the cloud-nat module to create a basic NAT that automatically generates a name and an NAT IP pool.

[^]: (autogen_docs_start)

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| credentials\_path | The path to a Google Cloud Service Account credentials file | string | - | yes |
| project\_id | The project ID to deploy to | string | - | yes |
| region | The region to deploy to | string | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| credentials\_path | - |
| name | - |
| project\_id | - |
| region | - |
| router\_name | - |

[^]: (autogen_docs_end)

To provision this example, run the following from within this directory:

- `terraform init` to get the plugins
- `terraform plan` to see the infrastructure plan
- `terraform apply` to apply the infrastructure build
- `terraform destroy` to destroy the built infrastructure
