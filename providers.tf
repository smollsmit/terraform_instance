
provider "google" {
  credentials = "${file("credentials.json")}"
  project     = "opportunity-quohai"
  region      = "${var.region_name}"
  zone        = "${var.zone_name}"
}
