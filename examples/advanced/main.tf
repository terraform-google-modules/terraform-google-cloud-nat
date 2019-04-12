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

module "cloud-nat" {
  source                           = "../../"
  project_id                       = "${var.project_id}"
  region                           = "${var.region}"
  router                           = "${google_compute_router.router.name}"
  name                             = "my-cloud-nat-${random_string.suffix.result}"
  nat_ips                          = "${google_compute_address.address.*.self_link}"
  min_ports_per_vm                 = "128"
  icmp_idle_timeout_sec            = "15"
  tcp_established_idle_timeout_sec = "600"
  tcp_transitory_idle_timeout_sec  = "15"
  udp_idle_timeout_sec             = "15"
}
