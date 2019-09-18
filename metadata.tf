// Adding SSH Public Key in Project Meta Data
#resource "google_compute_project_metadata_item" "ssh-keys" {
#  key   = "ssh-keys"
#  value = "${var.public_key}"
#}