/**
 * Copyright 2018 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

variable "project_id" {
  description = "The project ID to deploy to"
}

variable "region" {
  description = "The region to deploy to"
}

variable "icmp_idle_timeout_sec" {
  description = "(Optional) Timeout (in seconds) for ICMP connections. Defaults to 30s if not set. Changing this forces a new NAT to be created."
  default     = "30"
}

variable "min_ports_per_vm" {
  description = "(Optional) Minimum number of ports allocated to a VM from this NAT config. Defaults to 64 if not set. Changing this forces a new NAT to be created."
  default     = "64"
}

variable "name" {
  description = "(Optional) Defaults to 'cloud-nat-RANDOM_SUFFIX'. Changing this forces a new NAT to be created."
  default     = ""
}

variable "nat_ip_allocate_option" {
  description = "(Optional) Value inferred based on nat_ips. If present set to MANUAL_ONLY, otherwise AUTO_ONLY."
  default     = "false"
}

variable "nat_ips" {
  description = "(Optional) List of self_links of external IPs. Changing this forces a new NAT to be created."
  type        = list(string)
  default     = []
}

variable "router" {
  description = "(Required) The name of the router in which this NAT will be configured. Changing this forces a new NAT to be created."
}

variable "source_subnetwork_ip_ranges_to_nat" {
  description = "(Optional) Defaults to ALL_SUBNETWORKS_ALL_IP_RANGES. How NAT should be configured per Subnetwork. Valid values include: ALL_SUBNETWORKS_ALL_IP_RANGES, ALL_SUBNETWORKS_ALL_PRIMARY_IP_RANGES, LIST_OF_SUBNETWORKS. Changing this forces a new NAT to be created."
  default     = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}

variable "tcp_established_idle_timeout_sec" {
  description = "(Optional) Timeout (in seconds) for TCP established connections. Defaults to 1200s if not set. Changing this forces a new NAT to be created."
  default     = "1200"
}

variable "tcp_transitory_idle_timeout_sec" {
  description = "(Optional) Timeout (in seconds) for TCP transitory connections. Defaults to 30s if not set. Changing this forces a new NAT to be created."
  default     = "30"
}

variable "udp_idle_timeout_sec" {
  description = "(Optional) Timeout (in seconds) for UDP connections. Defaults to 30s if not set. Changing this forces a new NAT to be created."
  default     = "30"
}

