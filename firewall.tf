
resource "google_compute_firewall" "allow-internal" {
    name    = "${var.company}-${var.project}-fw-allow-internal"
    network = "${google_compute_network.vpc.name}"
    allow {
        protocol = "icmp"
    }
    allow {
        protocol = "tcp"
        ports    = ["0-65535"]
    }
    allow {
        protocol = "udp"
        ports    = ["0-65535"]
    }
    source_ranges = [
      "${var.frontend_subnet}",
      "${var.backend_subnet}"
      #"0.0.0.0/0"
    ]
}

resource "google_compute_firewall" "allow-web" {
    name    = "${var.company}-${var.project}-fw-allow-web"
    network = "${google_compute_network.vpc.name}"
    allow {
        protocol = "tcp"
        ports    = ["80","443"]
    }
    source_ranges = ["0.0.0.0/0"]
    target_tags = ["web"] 
}

resource "google_compute_firewall" "allow-ssh" {
    name    = "${var.company}-${var.project}-fw-allow-ssh"
    network = "${google_compute_network.vpc.name}"
    allow {
        protocol = "tcp"
        ports    = ["22"]
    }
    source_ranges = ["0.0.0.0/0"]
    target_tags = ["ssh"]
}

resource "google_compute_firewall" "frontend-allow-outbound" {
    name    = "web-allow-outbound"
    network = "${google_compute_network.vpc.name}"

    allow {
        protocol = "all"
    }

    source_ranges = ["0.0.0.0/0"]
}