variable "AWS_REGION" {
  default = "ap-southeast-2"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "mykey"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "mykey.pub"
}

variable "AMIS" {
  type = map(string)
  default = {
    ap-southeast-2 = "ami-0f39d06d145e9bb63"
  }
}

variable "database-pass" {
  default = "Cloudthat123"
}

variable "avzones" {
  type = list 
  default = ["ap-southeast-2a", "ap-southeast-2c"]
}
