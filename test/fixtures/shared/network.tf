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

resource "random_string" "suffix" {
  length  = 4
  special = false
  upper   = false
}

resource "google_compute_network" "network" {
  name                    = "cft-cloud-nat-test-${random_string.suffix.result}"
  auto_create_subnetworks = "false"
}

resource "google_compute_subnetwork" "subnetwork-a" {
  name          = "cft-cloud-nat-test-${random_string.suffix.result}-a"
  region        = var.region
  network       = google_compute_network.network.self_link
  ip_cidr_range = "10.0.0.0/16"
}

resource "google_compute_subnetwork" "subnetwork-b" {
  name          = "cft-cloud-nat-test-${random_string.suffix.result}-b"
  region        = var.region
  network       = google_compute_network.network.self_link
  ip_cidr_range = "10.1.0.0/16"
}

resource "google_compute_router" "router" {
  name    = "cft-cloud-nat-test-${random_string.suffix.result}"
  network = google_compute_network.network.self_link
}
