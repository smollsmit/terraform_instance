resource "google_compute_instance" "backend" {
  name         = "backend-${count.index + 1}"
  machine_type = "f1-micro"
  project      = "${var.project}"
  tags         = ["allow-ssh-from-all-in","allow-all-from-internal-in"]
  count = 2

  metadata = {
    sshKeys = "${var.gce_ssh_user}:${file(var.gce_ssh_pub_key_file)}"
  }
  
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    subnetwork    = "${google_compute_subnetwork.backend.name}"
    network_ip       = "10.1.2.1${count.index + 1}"
    access_config {
    }
  }
}