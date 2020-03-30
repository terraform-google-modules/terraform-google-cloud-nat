# Change Log

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/) and this
project adheres to [Semantic Versioning](http://semver.org/).
Releases are automated via [Conventional Commit](https://www.conventionalcommits.org/) messages.

## [1.2.0] - 2019-11-22

### Added

- Support for specific subnets with the `subnets` variable. [#10]

### Changed

- The `region` output depends on the `google_computer_router_nat` resource to enable a dependency graph between internal and 
  external resources. [#22]

## [1.1.0] - 2019-10-02

### Added

- `create_router` variable toggles management of a `google_compute_router`
  resource within the module. [#20]

## [1.0.0] - 2019-07-30

### Changed

- Supported version of Terraform is 0.12. [#12]

## [0.1.0] - 2019-04-30

### Added

- Initial release

[Unreleased]: https://github.com/terraform-google-modules/terraform-google-cloud-nat/compare/v1.2.0...HEAD
[1.2.0]: https://github.com/terraform-google-modules/terraform-google-cloud-nat/compare/v1.1.0...v1.2.0
[1.1.0]: https://github.com/terraform-google-modules/terraform-google-cloud-nat/compare/v1.0.0...v1.1.0
[1.0.0]: https://github.com/terraform-google-modules/terraform-google-cloud-nat/compare/v0.1.0...v1.0.0
[0.1.0]: https://github.com/terraform-google-modules/terraform-google-cloud-nat/releases/tag/v0.1.0

[#22]: https://github.com/terraform-google-modules/terraform-google-cloud-nat/issues/22
[#20]: https://github.com/terraform-google-modules/terraform-google-cloud-nat/pull/20
[#12]: https://github.com/terraform-google-modules/terraform-google-cloud-nat/pull/12
[#10]: https://github.com/terraform-google-modules/terraform-google-cloud-nat/issues/10
