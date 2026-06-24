variable "region" {
  type    = string 
  description = "Region added in tfvars"
}

variable "ami" {
  type    = string 
  description = "ami added in tfvars"
}

variable "public_key_path" {
  description = "Path to SSH public key"
  type        = string
}