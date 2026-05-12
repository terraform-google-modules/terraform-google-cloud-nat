/**
 * Copyright 2024 Google LLC
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

resource "google_compute_network" "network" {
  project                 = var.project_id
  name                    = "nat64-example-network"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnetwork" {
  project          = var.project_id
  name             = "nat64-example-subnet"
  region           = var.region
  network          = google_compute_network.network.id
  ip_cidr_range    = "10.0.0.0/24"
  stack_type       = "IPV4_IPV6"
  ipv6_access_type = "INTERNAL"
}

resource "google_compute_router" "router" {
  project = var.project_id
  name    = "nat64-example-router"
  region  = var.region
  network = google_compute_network.network.id
}

# NAT44 gateway for IPv4 egress
module "cloud_nat44" {
  source  = "terraform-google-modules/cloud-nat/google"
  version = "~> 7.0"

  project_id = var.project_id
  region     = var.region
  router     = google_compute_router.router.name
  name       = "nat44-example"

  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}

# NAT64 gateway translates IPv6 source addresses to IPv4 for internet egress.
# Uses a separate Cloud NAT resource; the two gateways share the same router.
# Note: ALL_IPV6_SUBNETWORKS is exclusive — no other NAT64 gateway may exist
# in the same region for this network.
module "cloud_nat64" {
  source  = "terraform-google-modules/cloud-nat/google"
  version = "~> 7.0"

  project_id = var.project_id
  region     = var.region
  router     = google_compute_router.router.name
  name       = "nat64-example"

  # NAT64 does not perform IPv4 NAT, so set an empty subnetwork list for NAT44.
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"

  source_subnetwork_ip_ranges_to_nat64 = "LIST_OF_IPV6_SUBNETWORKS"
  nat64_subnetworks = [
    { name = google_compute_subnetwork.subnetwork.id }
  ]
}
