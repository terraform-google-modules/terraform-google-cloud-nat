/**
 * Copyright 2019 Google LLC
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

locals {
  credentials_path = "${path.module}/${var.credentials_path}"
}

provider "google" {
  credentials = "${file(local.credentials_path)}"
  region      = "${var.region}"
  project     = "${var.project_id}"
}

resource "random_string" "suffix" {
  length  = 4
  special = false
  upper   = false
}

resource "google_compute_network" "main" {
  name                    = "cloud-nat-network${random_string.suffix.result}"
  auto_create_subnetworks = false
}

resource "google_compute_router" "main" {
  name    = "cloud-nat-router${random_string.suffix.result}"
  network = "${google_compute_network.main.name}"
}

resource "google_compute_subnetwork" "subnetwork-a" {
  name          = "cloud-nat-subnetwork-a${random_string.suffix.result}"
  region        = "${var.region}"
  network       = "${google_compute_network.main.self_link}"
  ip_cidr_range = "10.0.0.0/16"
}

resource "google_compute_subnetwork" "subnetwork-b" {
  name          = "loud-nat-subnetwork-b${random_string.suffix.result}"
  region        = "${var.region}"
  network       = "${google_compute_network.main.self_link}"
  ip_cidr_range = "10.1.0.0/16"
}
