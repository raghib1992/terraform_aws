terraform {
    backend "s3" {
        bucket = "shaheen-balti-1"  # provide the s3 bucket name
        key = "tarraform/backup"
        region = "ap-south-1"
    }
}

# aws cli must install in server
# aws configure to access s3