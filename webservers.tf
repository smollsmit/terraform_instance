resource "google_compute_instance" "frontend" {
  name         = "frontend"
  machine_type = "f1-micro"
  project      = "${var.project}"
  tags         = ["web"]

  metadata = {
    sshKeys = "${var.gce_ssh_user}:${file(var.gce_ssh_pub_key_file)}"
  }
  
  #metadata_startup_script = "sudo apt-get update && sudo apt-get install nginx -y && export HOSTNAME=$(hostname | tr -d '\n') && export PRIVATE_IP=$(curl -sf -H 'Metadata-Flavor:Google' http://metadata/computeMetadata/v1/instance/network-interfaces/0/ip | tr -d '\n') && echo "Welcome to $HOSTNAME - $PRIVATE_IP" > /usr/share/nginx/www/index.html && service nginx start"
  metadata_startup_script = <<SCRIPT
    sudo apt-get update
    sudo apt-get install nginx -y
    export HOSTNAME=$(hostname | tr -d '\n')
    export PRIVATE_IP=$(curl -sf -H 'Metadata-Flavor:Google' http://metadata/computeMetadata/v1/instance/network-interfaces/0/ip | tr -d '\n')
    echo "Welcome to $HOSTNAME - $PRIVATE_IP" > /var/www/html/index.html
  SCRIPT

  
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    subnetwork    = "${google_compute_subnetwork.frontend.name}"
    network_ip       = "10.1.1.10"
    access_config {
      #network_tier = "STANDARD"
    }
  }
}