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
  cloud_nat_required_roles = [
    "roles/compute.networkAdmin",
    "roles/iam.serviceAccountUser",
    "roles/owner"
  ]
}


resource "google_service_account" "cloud_nat" {
  project      = module.project_cloud_nat.project_id
  account_id   = "ci-cloud-nat"
  display_name = "ci-cloud-nat"
}

resource "google_project_iam_member" "cloud_nat" {
  count = length(local.cloud_nat_required_roles)

  project = module.project_cloud_nat.project_id
  role    = local.cloud_nat_required_roles[count.index]
  member  = "serviceAccount:${google_service_account.cloud_nat.email}"
}

resource "google_service_account_key" "cloud_nat" {
  service_account_id = google_service_account.cloud_nat.id
}
