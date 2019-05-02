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

//network

variable "cidr_block" {
  default = ""
}

variable "vpc_id" {
  default = ""
}

variable "svc_port" {
  default = 0
}

variable "priority" {
  default = 0
}

variable "alb_path" {
  default = ""
}

variable "target_group_name" {
  default = ""
}

variable "target_group_sticky" {
  default = ""
}

variable "target_group_path" {
  default = ""
}

variable "target_group_port" {
  default = 0
}

//servers
variable "vpc_security_group_id" {
  default = ""
}

variable "subnet_id" {
  default = ""
}

variable "subnet_id_b" {
  default = ""
}

variable "tomcat_server_type" {
  default     = ""
  description = "Used as env value of labels key-value"
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

variable "web_server_image" {
  default     = ""
  description = "The image used when to create disk"
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
