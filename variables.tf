## NAMING
variable "name" {
  description = "Name of the ECR repository."
  type        = string
}

variable "tags" {
  description = "Tags to add to the ECR repository."
  default     = {}
  type        = map(any)
}

## REPOSITORY
variable "image_tag_mutability" {
  description = "The tag mutability setting for the repository."
  default     = "MUTABLE"
  type        = string
}

variable "scan_on_push" {
  description = "Indicates whether images are scanned after being pushed to the repository."
  default     = true
  type        = bool
}

variable "force_delete" {
  description = "Delete the repository even if it contains images."
  default     = false
  type        = bool
}

variable "policy" {
  description = "Repository policy document in JSON format."
  default     = null
  type        = string
}

variable "lifecycle_rules" {
  description = "Lifecycle policy rules for expiring images."
  default = [
    {
      description     = "Keep the last 30 tagged images"
      tag_status      = "tagged"
      tag_prefix_list = ["latest", "prod", "sha"]
      count_type      = "imageCountMoreThan"
      count_number    = 30
    },
    {
      description  = "Expire untagged images older than 10 days"
      tag_status   = "untagged"
      count_type   = "sinceImagePushed"
      count_unit   = "days"
      count_number = 10
    }
  ]
  type = list(object({
    description     = optional(string)
    tag_status      = optional(string)
    tag_prefix_list = optional(list(string))
    count_type      = string
    count_unit      = optional(string)
    count_number    = number
  }))
}
