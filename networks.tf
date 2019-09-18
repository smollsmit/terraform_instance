
resource "google_compute_subnetwork" "frontend" {
  name          =  "${format("%s","${google_compute_network.vpc.name}-frontend-subnet")}"
  project       = "${var.project}"
  ip_cidr_range = "${var.frontend_subnet}"
  network       = "${google_compute_network.vpc.name}"
  region        = "${var.region_name}"
}

resource "google_compute_subnetwork" "backend" {
  name          =  "${format("%s","${google_compute_network.vpc.name}-backend-subnet")}"
  project       = "${var.project}"
  ip_cidr_range = "${var.backend_subnet}"
  network       = "${google_compute_network.vpc.name}"
  region        = "${var.region_name}"
}