# Change Log

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/) and this
project adheres to [Semantic Versioning](http://semver.org/).
Releases are automated via [Conventional Commit](https://www.conventionalcommits.org/) messages.

## [2.2.2](https://github.com/terraform-google-modules/terraform-google-cloud-nat/compare/v2.2.1...v2.2.2) (2023-01-20)


### Bug Fixes

* fixes lint issues and generates metadata ([#94](https://github.com/terraform-google-modules/terraform-google-cloud-nat/issues/94)) ([3896f11](https://github.com/terraform-google-modules/terraform-google-cloud-nat/commit/3896f113bcca73d4d2df9d17f829e51f3ef8f441))

### [2.2.1](https://github.com/terraform-google-modules/terraform-google-cloud-nat/compare/v2.2.0...v2.2.1) (2022-05-24)


### Bug Fixes

* add variable type in variables.tf ([#70](https://github.com/terraform-google-modules/terraform-google-cloud-nat/issues/70)) ([2cfe6d3](https://github.com/terraform-google-modules/terraform-google-cloud-nat/commit/2cfe6d326f19deaa901d97f225d608bc359d77d4))

## [2.2.0](https://github.com/terraform-google-modules/terraform-google-cloud-nat/compare/v2.1.0...v2.2.0) (2022-04-13)


### Features

* add router_keepalive_interval input var ([#66](https://github.com/terraform-google-modules/terraform-google-cloud-nat/issues/66)) ([8409e80](https://github.com/terraform-google-modules/terraform-google-cloud-nat/commit/8409e802dbda17ba4cadadc30687944af1955149))

## [2.1.0](https://www.github.com/terraform-google-modules/terraform-google-cloud-nat/compare/v2.0.0...v2.1.0) (2021-11-18)


### Features

* update TPG version constraints to allow 4.0 ([#61](https://www.github.com/terraform-google-modules/terraform-google-cloud-nat/issues/61)) ([6418dfd](https://www.github.com/terraform-google-modules/terraform-google-cloud-nat/commit/6418dfd1a6898578e03c8a65fe514e617aab7513))

## [2.0.0](https://www.github.com/terraform-google-modules/terraform-google-cloud-nat/compare/v1.4.0...v2.0.0) (2021-03-24)


### ⚠ BREAKING CHANGES

* add Terraform 0.13 constraint and module attribution (#48)

### Features

* add Terraform 0.13 constraint and module attribution ([#48](https://www.github.com/terraform-google-modules/terraform-google-cloud-nat/issues/48)) ([c4fd7b4](https://www.github.com/terraform-google-modules/terraform-google-cloud-nat/commit/c4fd7b4c8ac5777675d2880dac4169367de5d61f))

## [1.4.0](https://www.github.com/terraform-google-modules/terraform-google-cloud-nat/compare/v1.3.0...v1.4.0) (2021-02-17)


### Features

* add suport for setting enable_endpoint_independent_mapping options ([#46](https://www.github.com/terraform-google-modules/terraform-google-cloud-nat/issues/46)) ([1df7c42](https://www.github.com/terraform-google-modules/terraform-google-cloud-nat/commit/1df7c4251519e3536169f82a6986a57b124c1dd7))

## [1.3.0](https://www.github.com/terraform-google-modules/terraform-google-cloud-nat/compare/v1.2.0...v1.3.0) (2020-03-30)


### Features

* Add support for setting log_config ([#24](https://www.github.com/terraform-google-modules/terraform-google-cloud-nat/issues/24)) ([fb10d7d](https://www.github.com/terraform-google-modules/terraform-google-cloud-nat/commit/fb10d7d834ac0aa707183589d9b9bf4f4feda3c8))


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
