############ the variables in this file are passed in at environment level ############

variable "project" {
  default     = ""
  description = "The project name in GCP"
}

variable "region" {
  default     = ""
  description = "The region that project is located"
}

variable "zone" {
  default     = ""
  description = "The zone that instances are running in"
}

variable "credential" {
  default     = ""
  description = "The credential file to be used"
}

variable "aws_key_name" {
  default = ""
}

variable "public_key" {
  default = ""
}

variable "cidr_block" {
  default = ""
}

variable "public_subnet_cidr" {
  description = "CIDR for the Public Subnet"
  default     = "10.0.0.0/24"
}

variable "public_subnet_b_cidr" {
  description = "CIDR for the Public Subnet"
  default     = "10.0.9.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR for the Private Subnet"
  default     = "10.0.1.0/24"
}
