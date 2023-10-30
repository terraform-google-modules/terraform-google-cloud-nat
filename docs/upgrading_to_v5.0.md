# Upgrading to v5.0

The v5.0 release of *terraform-google-cloud-nat* is a backwards incompatible release.

## Default enable_endpoint_independent_mapping
The new `enable_endpoint_independent_mapping` default is `false`.

If you want to keep the old `enable_endpoint_independent_mapping` default of `true`, you should specify it explicitly:

```diff
module "cloud-nat" {
    source        = "terraform-google-modules/cloud-nat/google"
-   version       = "~> 4.1"
+   version       = "~> 5.0"
...
+   enable_endpoint_independent_mapping = true
```
