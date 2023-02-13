/**
 * # Terraform AWS ECR Repository Module
 *
 * Module to create an AWS ECR repository with lifecycle policies.
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
