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

variable "key_name" {
  default = ""
}

variable "cidr_block" {
  default = ""
}

variable "vpc_id" {
  default = ""
}

variable "vpc_security_group_id" {
  default = ""
}

variable "subnet_id" {
  default = ""
}

variable "private_subnet_id" {
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

variable "disk_type_ssd" {
  default     = "pd-ssd"
  description = "SSD hard disk type"
}

variable "disk_type_standard" {
  default     = "pd-standard"
  description = "Standard hard disk type"
}

variable "stages" {
  default     = ""
  description = "Used as env value of labels key-value"
}

//servers
variable "tomcat_server_type" {
  default     = ""
  description = "Used as env value of labels key-value"
}

variable "web_server_image" {
  default     = ""
  description = "The image used when to create disk"
}

variable "bastion_image" {
  default     = ""
  description = "The image used when to create disk"
}

variable "bastion_count" {
  default     = 0
  description = "Indicate how many instances to be created for this app"
}

variable "bastion_name" {
  default     = ""
  description = "Indicate the app name"
}

variable "bastion_machine_type" {
  default     = ""
  description = "Indicate the server CPU and RAM"
}

variable "bastion_size" {
  default     = 0
  description = "Indicate the boot disk size"
}

variable "web_server_count" {
  default     = 0
  description = "Indicate how many instances to be created for this app"
}

variable "web_server_name" {
  default     = ""
  description = "Indicate the app name"
}

variable "web_server_machine_type" {
  default     = ""
  description = "Indicate the server CPU and RAM"
}

variable "web_server_size" {
  default     = 0
  description = "Indicate the boot disk size"
}

variable "slave_server_count" {
  default     = 0
  description = "Indicate how many instances to be created for this app"
}

variable "slave_server_name" {
  default     = ""
  description = "Indicate the app name"
}

variable "slave_server_machine_type" {
  default     = ""
  description = "Indicate the server CPU and RAM"
}

variable "slave_server_size" {
  default     = 0
  description = "Indicate the boot disk size"
}
