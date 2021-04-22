# Provision VPC and firewall rules
resource "google_compute_network" "vpc_network" {
  name                    = "terraform-network"
  auto_create_subnetworks = "true"
}

resource "google_compute_firewall" "firewall_policy" {
  name    = "allow-ssh-http-jenkins"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = ["8080", "80", "22"]
  }
}
