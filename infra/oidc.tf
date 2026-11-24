locals {
  github_repo = "ova-app/ai-engine"
}

# Fait confiance aux jetons signés par GitHub Actions. Aucune clé AWS stockée dans GitHub.
resource "aws_iam_openid_connect_provider" "github" {
  url            = "https://token.actions.githubusercontent.com"
  client_id_list = ["sts.amazonaws.com"]
}

# Rôle que GitHub Actions endosse pour déployer. Utilisable seulement depuis la branche main
# de ce dépôt : une autre branche, un autre dépôt ou une PR de fork sont refusés.
resource "aws_iam_role" "deploy" {
  name = "ai-engine-github-deploy"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect    = "Allow"
      Principal = { Federated = aws_iam_openid_connect_provider.github.arn }
      Action    = "sts:AssumeRoleWithWebIdentity"
      Condition = {
        StringEquals = {
          "token.actions.githubusercontent.com:aud" = "sts.amazonaws.com"
          "token.actions.githubusercontent.com:sub" = "repo:${local.github_repo}:ref:refs/heads/main"
        }
      }
    }]
  })
}

# Droits minimaux : pousser dans le dépôt ECR de l'API, mettre à jour le code de la fonction.
resource "aws_iam_role_policy" "deploy" {
  name = "pousser-image-et-mettre-a-jour-lambda"
  role = aws_iam_role.deploy.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        # Obtenir un jeton de connexion à ECR : l'action n'accepte aucune restriction de ressource.
        Effect   = "Allow"
        Action   = "ecr:GetAuthorizationToken"
        Resource = "*"
      },
      {
        Effect = "Allow"
        Action = [
          "ecr:BatchCheckLayerAvailability",
          "ecr:InitiateLayerUpload",
          "ecr:UploadLayerPart",
          "ecr:CompleteLayerUpload",
          "ecr:PutImage",
          "ecr:DescribeImages",
          "ecr:DescribeRepositories",
        ]
        Resource = aws_ecr_repository.api.arn
      },
      {
        Effect = "Allow"
        Action = [
          "lambda:UpdateFunctionCode",
          "lambda:GetFunction",
          "lambda:GetFunctionConfiguration",
        ]
        Resource = aws_lambda_function.api.arn
      },
    ]
  })
}
