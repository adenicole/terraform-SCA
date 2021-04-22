# Provision VM instance
resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance"
  machine_type = "e2-standard-4"
  allow_stopping_for_update = true

  metadata = {
   ssh-keys = "adenicole:${file("~/.ssh/id_rsa.pub")}"
 }

  boot_disk {
    initialize_params {
      image = "ubuntu-2004-focal-v20210315"
    }
  }
  network_interface {
    network = google_compute_network.vpc_network.self_link
    access_config {
    }
  }
}
