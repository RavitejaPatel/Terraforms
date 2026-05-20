package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/azure"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestEnterprisePipelineDeployment(t *testing.T) {
	t.Parallel()

	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../",
	})

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

	rgName := terraform.Output(t, terraformOptions, "resource_group_name")

	exists := azure.ResourceGroupExists(t, rgName, "")
	assert.True(t, exists, "The target enterprise resource group was not provisioned successfully.")
}