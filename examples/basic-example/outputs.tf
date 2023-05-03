output "name" {
  description = "The name of the repository."
  value       = module.basic_example.name
}

output "arn" {
  description = "The ARN of the repository."
  value       = module.basic_example.arn
}

output "url" {
  description = "The URL of the repository (in the form aws_account_id.dkr.ecr.region.amazonaws.com/repositoryName)."
  value       = module.basic_example.url
}
