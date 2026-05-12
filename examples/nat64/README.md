# NAT64 Example

This example demonstrates how to configure a Cloud NAT gateway with NAT64, enabling IPv6-only VMs to reach IPv4 internet destinations.

NAT64 works alongside a regular NAT44 gateway on the same Cloud Router. The two gateways serve different traffic:

- **NAT44** (`module.cloud_nat44`) — translates IPv4 source addresses for outbound internet traffic, as usual.
- **NAT64** (`module.cloud_nat64`) — translates IPv6 source addresses to IPv4, allowing IPv6-only VMs to reach IPv4-only destinations.

## Usage

```hcl
module "cloud_nat64" {
  source  = "terraform-google-modules/cloud-nat/google"
  version = "~> 7.0"

  project_id = var.project_id
  region     = var.region
  router     = google_compute_router.router.name
  name       = "nat64"

  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"

  source_subnetwork_ip_ranges_to_nat64 = "ALL_IPV6_SUBNETWORKS"
}
```

## Notes

- `source_subnetwork_ip_ranges_to_nat64 = "ALL_IPV6_SUBNETWORKS"` is exclusive: no other Cloud NAT in the same region may also enable NAT64 for this network. Use `LIST_OF_IPV6_SUBNETWORKS` together with `nat64_subnetworks` to scope it to specific subnetworks.
- The subnetwork must have `stack_type = "IPV4_IPV6"` and `ipv6_access_type = "INTERNAL"` for NAT64 to apply.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| project\_id | The project ID to deploy to | `string` | n/a | yes |
| region | The region to deploy to | `string` | `"us-central1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| nat44\_name | Name of the NAT44 Cloud NAT gateway |
| nat64\_name | Name of the NAT64 Cloud NAT gateway |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
