variable "image_tag" {
  description = "Tag de l'image dans ECR à déployer sur Lambda."
  type        = string
  default     = "v0.2.0"
}

# Journaux de la fonction. Rétention courte : limite le coût de stockage.
resource "aws_cloudwatch_log_group" "api" {
  name              = "/aws/lambda/ai-engine-api"
  retention_in_days = 7
}

# Rôle d'exécution : Lambda l'endosse pour tourner. Droit unique : écrire ses journaux.
resource "aws_iam_role" "api" {
  name = "ai-engine-api-lambda"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect    = "Allow"
      Principal = { Service = "lambda.amazonaws.com" }
      Action    = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy" "api_logs" {
  name = "ecrire-les-journaux"
  role = aws_iam_role.api.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect   = "Allow"
      Action   = ["logs:CreateLogStream", "logs:PutLogEvents"]
      Resource = "${aws_cloudwatch_log_group.api.arn}:*"
    }]
  })
}

resource "aws_lambda_function" "api" {
  function_name = "ai-engine-api"
  role          = aws_iam_role.api.arn
  package_type  = "Image"
  image_uri     = "${aws_ecr_repository.api.repository_url}:${var.image_tag}"
  architectures = ["x86_64"]
  memory_size   = 512
  timeout       = 10

  depends_on = [
    aws_cloudwatch_log_group.api,
    aws_iam_role_policy.api_logs,
  ]
}

# URL HTTPS publique de la fonction. Sans authentification pour l'instant : seul /health existe.
# À remplacer par une authentification avant d'ajouter des routes qui coûtent (LLM).
resource "aws_lambda_function_url" "api" {
  function_name      = aws_lambda_function.api.function_name
  authorization_type = "NONE"
}

resource "aws_lambda_permission" "url_invoke" {
  statement_id           = "AutoriseUrlPublique"
  action                 = "lambda:InvokeFunctionUrl"
  function_name          = aws_lambda_function.api.function_name
  principal              = "*"
  function_url_auth_type = "NONE"
}

resource "aws_lambda_permission" "url_invoke_function" {
  statement_id             = "AutoriseInvocationViaUrl"
  action                   = "lambda:InvokeFunction"
  function_name            = aws_lambda_function.api.function_name
  principal                = "*"
  invoked_via_function_url = true
}

output "api_url" {
  description = "URL publique de l'API."
  value       = aws_lambda_function_url.api.function_url
}
