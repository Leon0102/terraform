# should specify optional and required

variable "instance_name" {
  description = "Name of ec2 instance"
  type = string
}

variable "ami" {
  description = "AMI to use ec2 instance"
  type = string
  default = "ami-0c55b159cbfafe1f0"
}

variable "instance_type" {
  description = "Type of ec2 instance"
  type = string
  default = "t2.micro"
}

variable "db_user" {
  description = "DB username"
  type = string
  default = "postgres"
}

variable "db_password" {
  description = "DB password"
  type = string
  default = "postgres"
  sensitive = true
}
