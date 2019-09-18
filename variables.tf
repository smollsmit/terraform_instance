# ---------- Projects params
variable "company" { 
    default = "home"
}

variable "project" {
    default = "opportunity-quohai"
}

variable "env" {
    default = "test"    
}

variable "region_name" {
    default = "europe-west3"  
}

variable "zone_name" {
    default = "europe-west3-a"
}

# ---------- Network
variable "frontend_subnet" {
    default = "10.1.1.0/24"
}

variable "backend_subnet" {
    default = "10.1.2.0/24"
}

# ---------- Users
variable "gce_ssh_user" {
    default = "s.smetanin"
}
variable "gce_ssh_pub_key_file" {
    default = "/home/smith/.ssh/id_rsa.pub"
}