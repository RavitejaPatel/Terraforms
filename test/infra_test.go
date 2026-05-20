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
		// Points exactly to your root Terraform folder where main.tf lives
		TerraformDir: "../",
	})

	// Ensures clean up runs right after test completion
	defer terraform.Destroy(t, terraformOptions)

	// Runs 'terraform init' and 'terraform apply' inside the runner
	terraform.InitAndApply(t, terraformOptions)

	// Captures the output variables from state maps
	rgName := terraform.Output(t, terraformOptions, "resource_group_name")

	// Confirms resource validation checks inside your Azure subscription
	exists := azure.ResourceGroupExists(t, rgName, "")
	assert.True(t, exists, "The target enterprise resource group was not provisioned successfully.")
}
