variable "instance_names" {
  type = map
  default = {
    db-dev = "t3.small"
    backend-dev = "t3.micro"
    frontend-dev = "t3.micro"
  }
}

variable "environment" {
  default = "dev"  
}

variable "common_tags" {
    type = map
    default = {
        project = "Expense"
        terraform - true
  
}

variable "domain_name" {
    default = "daws78s.online"  
}

variable "zone_id" {
    default = " " #copy from AWS R53Z3M3QZ7XQZ7S1"
  
}