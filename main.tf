# main.tf - INSECURE TERRAFORM FOR TESTING PURPOSES

resource "aws_security_group" "allow_all" {
  name        = "allow_all_traffic"
  description = "Extremely insecure SG"

  # FALHA 4: Ingress escancarado
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # FALHA 5: Egress escancarado
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_s3_bucket" "insecure_bucket" {
  bucket = "my-very-insecure-data-bucket"
  
  # FALHA 6: ACL Pública (Dados expostos)
  acl    = "public-read"
}