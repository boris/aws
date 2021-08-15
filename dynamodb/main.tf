provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region     = var.region

  # Needed for local development
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    dynamodb = "http://localhost:4566"
  }
}
