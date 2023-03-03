variable "rgname" {
  type        = string
  description = "resource group name"
}

variable "location" {
  type    = string
  default = "southindia"
}

variable "serviceplan_name" {
  type = string
  default = "HelloWorld0102"
}

variable "appservice_name" {
  type = string
  default = "HelloWorld010203"
}

variable "environment" {
  type = string
  default = "Dev"
}