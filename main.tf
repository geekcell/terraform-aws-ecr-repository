/**
 * # Terraform AWS ECR Repository
 *
 * Are you looking for an efficient way to manage your Docker images in AWS? Look no further! Our team has extensive
 * experience working with AWS ECS and has optimized this Terraform module for AWS Elastic Container Registry (ECR)
 * that includes a lifecycle policy.
 *
 * This module makes it easy to set up and manage your ECR repositories, as well as automatically delete images that
 * are older than 30 days, saving you storage space and reducing your costs. The lifecycle policy ensures that your
 * repositories are clean and up-to-date, freeing up resources and improving the performance of your application.
 *
 * Our team has optimized this Terraform module to provide a seamless experience for users. Whether you are just
 * getting started with containers or looking to enhance your current setup, this module provides a preconfigured
 * solution for efficiently managing your ECS Cluster with enabled Container Insights, logging, and advanced monitoring.
 *
 * With this Terraform module, you can quickly set up and manage your ECR repositories, and take advantage of the
 * benefits of a lifecycle policy, all with just a few simple commands. Try it out today!
 */
resource "aws_ecr_repository" "main" {
  name                 = var.name
  image_tag_mutability = var.image_tag_mutability
  force_delete         = var.force_delete

  image_scanning_configuration {
    scan_on_push = var.scan_on_push
  }

  tags = var.tags
}

resource "aws_ecr_repository_policy" "main" {
  count = var.policy != null ? 1 : 0

  repository = aws_ecr_repository.main.name
  policy     = var.policy
}

resource "aws_ecr_lifecycle_policy" "main" {
  count = length(var.lifecycle_rules) > 0 ? 1 : 0

  repository = aws_ecr_repository.main.name
  policy     = data.jq_query.main.result
}

# AWS will complain if we send any optional values with a null value. A simple way to get around this is to use jq
# to remove any null values from the JSON before sending it to AWS.
data "jq_query" "main" {
  query = "del(..|nulls)"
  data = jsonencode({
    rules = [
      for index, rule in var.lifecycle_rules : {
        rulePriority = index + 1
        description  = rule.description

        selection = {
          tagStatus     = rule.tag_status
          tagPrefixList = rule.tag_prefix_list
          countType     = rule.count_type
          countUnit     = rule.count_unit
          countNumber   = rule.count_number
        }

        action = {
          type = "expire"
        }
      }
    ]
  })
}
