#Creating roles Policy
resource "aws_iam_role_policy" "s3_bucket_policy" {
  name = "s3_bucket_policy"
  role = aws_iam_role.s3_bucket.id
  policy = <<EOF
  {
      "verison": "2012-10-17",
      "statement": [
          {
              "Action": [
                  "s3:*"
              ],
              "Effects": "Allow",
              "Resource": [
                  "arn:aws:s3:::shaheenbalti14",
                  "arn:aws:s3:::shaheenbalti14/*"
              ]
          }
      ]
  }
  EOF
}

#creating roles
resource "aws_iam_role" "s3_bucket" {
  name = "s3_bucket"
  assume_role_policy = <<EOF
  {
      "verison": "2012-10-17",
      "statement": [
          {
              "Action": "sts.AssumeRole",
              "Principal": {
                  "service": "ec2.amazonaws.com"
              },
          "Effects": "Allow",
          "sid": ""
          }
      ]
  }
  EOF
}

resource "aws_iam_instance_profile" "s3_access" {
  name = "s3_access"
  roles = ["${aws_iam_role.s3_bucket.name}"]
}

