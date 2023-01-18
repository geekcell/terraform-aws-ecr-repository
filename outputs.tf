output "arn" {
  description = "The ARN of the repository."
  value       = aws_ecr_repository.main.arn
}

output "url" {
  description = "The URL of the repository (in the form aws_account_id.dkr.ecr.region.amazonaws.com/repositoryName)."
  value       = aws_ecr_repository.main.repository_url
}
