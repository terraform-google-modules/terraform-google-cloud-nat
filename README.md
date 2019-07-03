# Terraform Google Cloud NAT Module

This module handles opinionated Google Cloud Platform Cloud NAT creation and configuration.

## Compatibility

 This module is meant for use with Terraform 0.12. If you haven't [upgraded](https://www.terraform.io/upgrade-guides/0-12.html)
  and need a Terraform 0.11.x-compatible version of this module, the last released version intended for
  Terraform 0.11.x is [0.1.0](https://registry.terraform.io/modules/terraform-google-modules/cloud-nat/google/0.1.0).

## Usage

There are multiple examples included in the [examples](./examples/) folder but simple usage is as follows:

```hcl
module "cloud-nat" {
  source     = "terraform-google-modules/cloud-nat/google"
  project_id = "${var.project_id}"
  region     = "${var.region}"
  router     = "${google_compute_router.router.name}"
}
```

Then perform the following commands on the root folder:

- `terraform init` to get the plugins
- `terraform plan` to see the infrastructure plan
- `terraform apply` to apply the infrastructure build
- `terraform destroy` to destroy the built infrastructure

[^]: (autogen_docs_start)

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| icmp\_idle\_timeout\_sec | (Optional) Timeout (in seconds) for ICMP connections. Defaults to 30s if not set. Changing this forces a new NAT to be created. | string | `"30"` | no |
| min\_ports\_per\_vm | (Optional) Minimum number of ports allocated to a VM from this NAT config. Defaults to 64 if not set. Changing this forces a new NAT to be created. | string | `"64"` | no |
| name | (Optional) Defaults to 'cloud-nat-RANDOM_SUFFIX'. Changing this forces a new NAT to be created. | string | `""` | no |
| nat\_ip\_allocate\_option | (Optional) Value inferred based on nat_ips. If present set to MANUAL_ONLY, otherwise AUTO_ONLY. | string | `"false"` | no |
| nat\_ips | (Optional) List of self_links of external IPs. Changing this forces a new NAT to be created. | list | `<list>` | no |
| project\_id | The project ID to deploy to | string | n/a | yes |
| region | The region to deploy to | string | n/a | yes |
| router | (Required) The name of the router in which this NAT will be configured. Changing this forces a new NAT to be created. | string | n/a | yes |
| source\_subnetwork\_ip\_ranges\_to\_nat | (Optional) Defaults to ALL_SUBNETWORKS_ALL_IP_RANGES. How NAT should be configured per Subnetwork. Valid values include: ALL_SUBNETWORKS_ALL_IP_RANGES, ALL_SUBNETWORKS_ALL_PRIMARY_IP_RANGES, LIST_OF_SUBNETWORKS. Changing this forces a new NAT to be created. | string | `"ALL_SUBNETWORKS_ALL_IP_RANGES"` | no |
| tcp\_established\_idle\_timeout\_sec | (Optional) Timeout (in seconds) for TCP established connections. Defaults to 1200s if not set. Changing this forces a new NAT to be created. | string | `"1200"` | no |
| tcp\_transitory\_idle\_timeout\_sec | (Optional) Timeout (in seconds) for TCP transitory connections. Defaults to 30s if not set. Changing this forces a new NAT to be created. | string | `"30"` | no |
| udp\_idle\_timeout\_sec | (Optional) Timeout (in seconds) for UDP connections. Defaults to 30s if not set. Changing this forces a new NAT to be created. | string | `"30"` | no |

## Outputs

| Name | Description |
|------|-------------|
| name | Name of the Cloud NAT |
| nat\_ip\_allocate\_option | NAT IP allocation mode |
| region | Cloud NAT region |
| router\_name | Cloud NAT router name |

[^]: (autogen_docs_end)

## Requirements

Before this module can be used on a project, you must ensure that the following pre-requisites are fulfilled:

1. Terraform and kubectl are [installed](#software-dependencies) on the machine where Terraform is executed.
2. The Service Account you execute the module with has the right [permissions](#iam-roles).
3. The APIs are [active](#enable-apis) on the project you will launch the cluster in.
4. If you are using a Shared VPC, the APIs must also be activated on the Shared VPC host project and your service account needs the proper permissions there.

### Terraform plugins

- [Terraform](https://www.terraform.io/downloads.html) 0.12.x
- [terraform-provider-google](https://github.com/terraform-providers/terraform-provider-google) plugin v2.7.0

### Configure a Service Account

In order to execute this module you must have a Service Account with the
following project roles:

- [roles/compute.networkAdmin](https://cloud.google.com/nat/docs/using-nat#iam_permissions)

### Enable APIs

In order to operate with the Service Account you must activate the following APIs on the project where the Service Account was created:

- Compute Engine API - compute.googleapis.com

## Contributing

Refer to the [contribution guidelines](../CONTRIBUTING.md) for information on contributing to this module.