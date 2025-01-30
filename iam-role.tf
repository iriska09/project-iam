// iam role for secrets manager to read and write 
resource "aws_iam_role" "ec2_secrets_manager_role" {
  name = var.iam_role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
}


// iam policy to iam role 

resource "aws_iam_policy" "secrets_manager_policy" {
  name        = var.iam_policy_name
  description = "Policy to allow read and write access to Secrets Manager"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "secretsmanager:GetSecretValue",
          "secretsmanager:DescribeSecret",
          "secretsmanager:ListSecrets",
          "secretsmanager:PutSecretValue",
          "secretsmanager:CreateSecret",
          "secretsmanager:UpdateSecret"
        ],
        Resource = "*"
      }
    ]
  })
}
// attach_policy to the role 
resource "aws_iam_role_policy_attachment" "attach_policy" {
  policy_arn = aws_iam_policy.secrets_manager_policy.arn
  role       = aws_iam_role.ec2_secrets_manager_role.name
}

// instance profile for instance and role 

resource "aws_iam_instance_profile" "ec2_instance_profile" {
  name = var.instance_profile_name
  role = aws_iam_role.ec2_secrets_manager_role.name
}



