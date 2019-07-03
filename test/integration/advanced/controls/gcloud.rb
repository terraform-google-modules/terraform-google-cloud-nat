# Copyright 2018 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

project_id = attribute('project_id')
region = attribute('region')
router = attribute('router_name')
nat = attribute('name')

control "gcloud" do
  title "Google Compute Router NAT configuration"
  describe command("gcloud --project #{project_id} compute routers nats describe #{nat} --router=#{router} --router-region #{region} --format json") do
    its(:exit_status) { should eq 0 }
    its(:stderr) { should eq '' }

    let!(:data) do
      if subject.exit_status == 0
        JSON.parse(subject.stdout)
      else
        {}
      end
    end

    describe "nat" do
      it "did not generate a NAT name" do
        expect(data["name"]).not_to match(/^cloud-nat-...../)
      end

      it "set IP allocation to manual" do
        expect(data["natIpAllocateOption"]).to eq("MANUAL_ONLY")
      end

      it "set subnet IP ranges to all subnets, all IP ranges" do
        expect(data["sourceSubnetworkIpRangesToNat"]).to eq("ALL_SUBNETWORKS_ALL_IP_RANGES")
      end

      it "sets the ICMP idle timeout to 15 seconds" do
        expect(data["icmpIdleTimeoutSec"]).to eq(15)
      end

      it "sets the minimum ports per VM to 128" do
        expect(data["minPortsPerVm"]).to eq(128)
      end

      it "sets the TCP established idle timeout to 600 seconds" do
        expect(data["tcpEstablishedIdleTimeoutSec"]).to eq(600)
      end

      it "sets the TCP transitory idle timeout to 15 seconds" do
        expect(data["tcpTransitoryIdleTimeoutSec"]).to eq(15)
      end

      it "sets the UDP idle timeout to 15 seconds" do
        expect(data["udpIdleTimeoutSec"]).to eq(15)
      end
    end
  end
end
