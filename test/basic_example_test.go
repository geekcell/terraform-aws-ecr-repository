package test

import (
	"os"
	"testing"

	TTAWS "github.com/gruntwork-io/terratest/modules/aws"
	"github.com/gruntwork-io/terratest/modules/terraform"

	"github.com/stretchr/testify/assert"

	"github.com/aws/aws-sdk-go/aws"
	"github.com/aws/aws-sdk-go/aws/session"
	"github.com/aws/aws-sdk-go/service/ecr"
)

func TestTerraformECRRepoBasicExample(t *testing.T) {
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../examples/basic-example",
	})

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

	name := terraform.Output(t, terraformOptions, "name")
	assert.NotEmpty(t, name)

	arn := terraform.Output(t, terraformOptions, "arn")
	assert.NotEmpty(t, arn)

	url := terraform.Output(t, terraformOptions, "url")
	assert.NotEmpty(t, url)

	sess, err := NewSession(os.Getenv("AWS_REGION"))
	assert.NoError(t, err)

	ecrClient := ecr.New(sess)

	input := &ecr.DescribeRepositoriesInput{RepositoryNames: []*string{&name}}
	output, err := ecrClient.DescribeRepositories(input)
	assert.NoError(t, err)

	assert.Equal(t, 1, len(output.Repositories))
	assert.Equal(t, name, aws.StringValue(output.Repositories[0].RepositoryName))
	assert.Equal(t, arn, aws.StringValue(output.Repositories[0].RepositoryArn))
	assert.Equal(t, url, aws.StringValue(output.Repositories[0].RepositoryUri))

	assert.Equal(t, "AES256", aws.StringValue(output.Repositories[0].EncryptionConfiguration.EncryptionType))
}

func NewSession(region string) (*session.Session, error) {
	sess, err := TTAWS.NewAuthenticatedSession(region)
	if err != nil {
		return nil, err
	}

	return sess, nil
}
