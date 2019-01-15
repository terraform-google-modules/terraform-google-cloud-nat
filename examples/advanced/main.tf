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

resource "google_compute_address" "main" {
  name   = "cloud-nat-address${var.name_suffix}"
  region = "${var.region}"
}

module "cloud-nat" {
  source     = "../../"
  project_id = "${var.project_id}"
  region     = "${var.region}"
  name       = "cloud-nat${var.name_suffix}"
  router     = "${var.router}"
  nat_ips    = "${list(google_compute_address.main.self_link)}"

  min_ports_per_vm = "${var.min_ports_per_vm}"
  icmp_idle_timeout_sec = "${var.icmp_idle_timeout_sec}"
  tcp_established_idle_timeout_sec = "${var.tcp_established_idle_timeout_sec}"
  tcp_transitory_idle_timeout_sec = "${var.tcp_transitory_idle_timeout_sec}"
  udp_idle_timeout_sec = "${var.udp_idle_timeout_sec}"
}
