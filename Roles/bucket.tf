resource "aws_s3_bucket" "b" {
  bucket = "shaheenbalti14"
  acl = "private"
  tags = {
      Name = "shaheenbalti14"
  }
}
