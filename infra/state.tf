# Bucket qui stocke l'état Terraform. Le nom est global à tout AWS : suffixe aléatoire.
# Ce nom doit rester identique à celui du bloc backend dans versions.tf.
resource "aws_s3_bucket" "tfstate" {
  bucket = "ai-engine-tfstate-0852ca23"

  # Un `terraform destroy` ne doit jamais effacer l'état.
  lifecycle {
    prevent_destroy = true
  }
}

# Chaque modification de l'état est gardée : retour en arrière possible.
resource "aws_s3_bucket_versioning" "tfstate" {
  bucket = aws_s3_bucket.tfstate.id

  versioning_configuration {
    status = "Enabled"
  }
}

# L'état contient des valeurs sensibles (e-mail du budget) : chiffré au repos.
resource "aws_s3_bucket_server_side_encryption_configuration" "tfstate" {
  bucket = aws_s3_bucket.tfstate.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# Aucun accès public, quoi qu'il arrive.
resource "aws_s3_bucket_public_access_block" "tfstate" {
  bucket = aws_s3_bucket.tfstate.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# Supprime les anciennes versions après 30 jours : limite le coût de stockage.
resource "aws_s3_bucket_lifecycle_configuration" "tfstate" {
  bucket = aws_s3_bucket.tfstate.id

  rule {
    id     = "expirer-anciennes-versions"
    status = "Enabled"

    filter {}

    noncurrent_version_expiration {
      noncurrent_days = 30
    }
  }
}
