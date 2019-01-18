# Terraform Google Cloud NAT Module

This module handles opinionated Google Cloud Platform Cloud NAT creation and configuration.

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
| icmp\_idle\_timeout\_sec | (Optional) Timeout (in seconds) for ICMP connections. Defaults to 30s if not set. Changing this forces a new NAT to be created. | string | `30` | no |
| min\_ports\_per\_vm | (Optional) Minimum number of ports allocated to a VM from this NAT config. Defaults to 64 if not set. Changing this forces a new NAT to be created. | string | `64` | no |
| name | (Optional) Defaults to 'cloud-nat-RANDOM_SUFFIX'. Changing this forces a new NAT to be created. | string | `` | no |
| nat\_ip\_allocate\_option | (Optional) Value inferred based on nat_ips. If present set to MANUAL_ONLY, otherwise AUTO_ONLY. | string | `false` | no |
| nat\_ips | (Optional) List of self_links of external IPs. Changing this forces a new NAT to be created. | list | `<list>` | no |
| project\_id | The project ID to deploy to | string | - | yes |
| region | The region to deploy to | string | - | yes |
| router | (Required) The name of the router in which this NAT will be configured. Changing this forces a new NAT to be created. | string | - | yes |
| source\_subnetwork\_ip\_ranges\_to\_nat | (Optional) Defaults to ALL_SUBNETWORKS_ALL_IP_RANGES. How NAT should be configured per Subnetwork. Valid values include: ALL_SUBNETWORKS_ALL_IP_RANGES, ALL_SUBNETWORKS_ALL_PRIMARY_IP_RANGES, LIST_OF_SUBNETWORKS. Changing this forces a new NAT to be created. | string | `ALL_SUBNETWORKS_ALL_IP_RANGES` | no |
| tcp\_established\_idle\_timeout\_sec | (Optional) Timeout (in seconds) for TCP established connections. Defaults to 1200s if not set. Changing this forces a new NAT to be created. | string | `1200` | no |
| tcp\_transitory\_idle\_timeout\_sec | (Optional) Timeout (in seconds) for TCP transitory connections. Defaults to 30s if not set. Changing this forces a new NAT to be created. | string | `30` | no |
| udp\_idle\_timeout\_sec | (Optional) Timeout (in seconds) for UDP connections. Defaults to 30s if not set. Changing this forces a new NAT to be created. | string | `30` | no |

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

- [Terraform](https://www.terraform.io/downloads.html) >= 0.10.x
- [terraform-provider-google](https://github.com/terraform-providers/terraform-provider-google) plugin v1.8.0

### Configure a Service Account

In order to execute this module you must have a Service Account with the
following project roles:

- [roles/compute.networkAdmin](https://cloud.google.com/nat/docs/using-nat#iam_permissions)

### Enable APIs

In order to operate with the Service Account you must activate the following APIs on the project where the Service Account was created:

- Compute Engine API - compute.googleapis.com

## Install

### Terraform

Be sure you have the correct Terraform version (>= 0.10.x), you can choose the binary here:

- https://releases.hashicorp.com/terraform/

## File structure

The project has the following folders and files:

- /: root folder
- /examples: examples for using this module
- /scripts: Scripts for specific tasks on module (see Infrastructure section on this file)
- /test: Folders with files for testing the module (see Testing section on this file)
- /main.tf: main file for this module, contains all the resources to create
- /variables.tf: all the variables for the module
- /output.tf: the outputs of the module
- /readme.MD: this file

## Testing

### Requirements

- [bundler](https://github.com/bundler/bundler)
- [gcloud](https://cloud.google.com/sdk/install)
- [terraform-docs](https://github.com/segmentio/terraform-docs/releases) 0.3.0

### Integration test

Integration tests are run though [test-kitchen](https://github.com/test-kitchen/test-kitchen), [kitchen-terraform](https://github.com/newcontext-oss/kitchen-terraform), and [InSpec](https://github.com/inspec/inspec).

Two test-kitchen instances are defined:

- `basic`
- `advanced`

The test-kitchen instances in `test/fixtures/` wrap identically-named examples in the `examples/` directory.

#### Setup

1. Configure the [test fixtures](#test-configuration)
2. Download a Service Account key with the necessary permissions and put it in the module's root directory with the name `credentials.json`.
3. Build the Docker containers for testing:

  ```shell
  make docker_build_terraform
  make docker_build_kitchen_terraform
  ```

4. Run the testing container in interactive mode:

  ```shell
  make docker_run
  ```

  The module root directory will be loaded into the Docker container at `/cftk/workdir/`.
5. Run kitchen-terraform to test the infrastructure:

  1. `kitchen create` creates Terraform state and downloads modules, if applicable.
  2. `kitchen converge` creates the underlying resources. Run `kitchen converge <INSTANCE_NAME>` to create resources for a specific test case.
  3. `kitchen verify` tests the created infrastructure. Run `kitchen verify <INSTANCE_NAME>` to run a specific test case.
  4. `kitchen destroy` tears down the underlying resources created by `kitchen converge`. Run `kitchen destroy <INSTANCE_NAME>` to tear down resources for a specific test case.

Alternatively, you can simply run `make test_integration_docker` to run all the test steps non-interactively.

#### Test configuration

Each test-kitchen instance is configured with a `variables.tfvars` file in the test fixture directory, e.g. `test/fixtures/basic/terraform.tfvars`.
For convenience, since all of the variables are project-specific, these files have been symlinked to `test/fixtures/shared/terraform.tfvars`.
Similarly, each test fixture has a `variables.tf` to define these variables, and an `outputs.tf` to facilitate providing necessary information for `inspec` to locate and query against created resources.

Each test-kitchen instance creates a GCP Network and Subnetwork fixture to house resources, and may create any other necessary fixture data as needed.

### Autogeneration of documentation from .tf files

Run

```shell
make generate_docs
```

### Linting

The makefile in this project will lint or sometimes just format any shell,
Python, golang, Terraform, or Dockerfiles. The linters will only be run if
the makefile finds files with the appropriate file extension.

All of the linter checks are in the default make target, so you just have to
run

```shell
make -s
```

The -s is for 'silent'. Successful output looks like this

```shell
Running shellcheck
Running flake8
Running go fmt and go vet
Running terraform validate
Running hadolint on Dockerfiles
Checking for required files
Testing the validity of the header check
..
----------------------------------------------------------------------
Ran 2 tests in 0.026s

OK
Checking file headers
The following lines have trailing whitespace
```

The linters
are as follows:

- Shell - shellcheck. Can be found in homebrew
- Python - flake8. Can be installed with 'pip install flake8'
- Golang - gofmt. gofmt comes with the standard golang installation. golang is a compiled language so there is no standard linter.
- Terraform - terraform has a built-in linter in the 'terraform validate' command.
- Dockerfiles - hadolint. Can be found in homebrew
