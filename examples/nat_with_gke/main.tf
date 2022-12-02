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

# [START vpc_network_nat_gke]
module "test-vpc-module" {
  source       = "terraform-google-modules/network/google"
  version      = "~> 6.0"
  project_id   = var.project_id # Replace this with your project ID in quotes
  network_name = "custom-network1"
  mtu          = 1460

  subnets = [
    {
      subnet_name   = "subnet-us-east-192"
      subnet_ip     = "192.168.1.0/24"
      subnet_region = "us-east4"
    }
  ]
}
# [END vpc_network_nat_gke]

# [START gke_private_cluster_nat_gke]
resource "google_container_cluster" "primary" {
  project            = var.project_id
  name               = "nat-test-cluster"
  location           = "us-east4-c"
  initial_node_count = 3
  network            = var.network # Replace with a reference or self link to your network, in quotes
  subnetwork         = var.subnet  # Replace with a reference or self link to your subnet, in quotes
  private_cluster_config {
    master_ipv4_cidr_block  = "172.16.0.0/28"
    enable_private_endpoint = true
    enable_private_nodes    = true
  }
  ip_allocation_policy {
  }
  master_authorized_networks_config {
  }
}
# [END gke_private_cluster_nat_gke]

# [START vpc_firewall_nat_gke]
resource "google_compute_firewall" "rules" {
  project = var.project_id
  name    = "allow-ssh"
  network = var.network
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_ranges = ["35.235.240.0/20"]
}
# [END vpc_firewall_nat_gke]

# [START cloudnat_router_nat_gke]
resource "google_compute_router" "router" {
  project = var.project_id
  name    = "nat-router"
  network = var.network
  region  = "us-east4"
}
# [END cloudnat_router_nat_gke]

# [START cloudnat_nat_gke]
module "cloud-nat" {
  source                             = "terraform-google-modules/cloud-nat/google"
  version                            = "~> 2.0"
  project_id                         = var.project_id
  region                             = "us-east4"
  router                             = google_compute_router.router.name
  name                               = "nat-config"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}
# [END cloudnat_nat_gke]
