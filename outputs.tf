# arn of the IAM role created for ec instance to access sm
output "ec2_secrets_manager_role_arn" {
  description = "arn of the IAM role created for ec instance to access sm"
  value       = aws_iam_role.ec2_secrets_manager_role.arn
}

# arn of the IAM policy for sm access
output "secrets_manager_policy_arn" {
  description = "arn of the IAM policy for sm access"
  value       = aws_iam_policy.secrets_manager_policy.arn
}

# arn of the IAM instance profile that will attached to instance
output "ec2_instance_profile_arn" {
  description = "arn of the IAM instance profile that will attached to instance"
  value       = aws_iam_instance_profile.ec2_instance_profile.arn
}

# name of the IAM role
output "ec2_secrets_manager_role_name" {
  description = "name of the IAM role"
  value       = aws_iam_role.ec2_secrets_manager_role.name
}

# name of the instance profile
output "ec2_instance_profile_name" {
  description = "name of the instance profile"
  value       = aws_iam_instance_profile.ec2_instance_profile.name
}