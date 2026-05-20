package test

import (
	"testing"
	"://github.com"
	"://github.com"
	"://github.com"
)

func TestEnterprisePipelineDeployment(t *testing.T) {
	t.Parallel()

	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../",
	})

	// Ensures cleanup runs post-test execution
	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

	rgName := terraform.Output(t, terraformOptions, "resource_group_name")
	exists := azure.ResourceGroupExists(t, rgName, "")
	assert.True(t, exists, "The target resource group was not provisioned successfully.")
}
