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

output "nat44_name" {
  description = "Name of the NAT44 Cloud NAT gateway"
  value       = module.cloud_nat44.name
}

output "nat64_name" {
  description = "Name of the NAT64 Cloud NAT gateway"
  value       = module.cloud_nat64.name
}
