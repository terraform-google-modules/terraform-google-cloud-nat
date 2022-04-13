// Copyright 2022 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

package basic

import (
	"testing"

	"github.com/GoogleCloudPlatform/cloud-foundation-toolkit/infra/blueprint-test/pkg/gcloud"
	"github.com/GoogleCloudPlatform/cloud-foundation-toolkit/infra/blueprint-test/pkg/golden"
	"github.com/GoogleCloudPlatform/cloud-foundation-toolkit/infra/blueprint-test/pkg/tft"
	"github.com/stretchr/testify/assert"
)

func TestBasic(t *testing.T) {
	bpt := tft.NewTFBlueprintTest(t)

	bpt.DefineVerify(func(assert *assert.Assertions) {
		bpt.DefaultVerify(assert)

		projectId := bpt.GetStringOutput("project_id")
		region := bpt.GetStringOutput("region")
		name := bpt.GetStringOutput("name")
		routerName := bpt.GetStringOutput("router_name")
		randomID := bpt.GetStringOutput("random_id")

		op := gcloud.Runf(t, "compute routers nats describe %s --router %s --router-region %s --project %s", name, routerName, region, projectId)
		g := golden.NewOrUpdate(t, op.String(),
			golden.WithStringSanitizer(projectId, "PROJECT_ID"),
			golden.WithStringSanitizer(randomID, "RANDOM_ID"),
		)
		assert.JSONEq(g.GetJSON().String(), g.GetSanitizedJSON(op).String())
	})

	bpt.Test()
}
