variable "AWS_REGION" {}

variable "AWS_ACCESS_KEY" {}

variable "AWS_SECRET_KEY" {}

variable "PUBLIC_KEY" {
    default = "test-key.pub"  
}

variable "PRIVATE_KEY" {
    default = "test-key.pem"  
}

variable "AMIS" {
    type = map(string)
    default = {
        ap-south-1 = "ami-0d758c1134823146a"
    }
}