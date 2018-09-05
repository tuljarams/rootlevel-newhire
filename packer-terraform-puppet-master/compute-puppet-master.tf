#####################################################################
# Ngnix-webserver VM Instances
#####################################################################
# Assigne default scope values
variable "api-scopes" {
  default = []
  type    = "list"
}
# Create a new instance
resource "google_compute_instance" "rootlevel-puppet-master" {
  name = "rootlevel-puppet-master"
  machine_type = "n1-standard-1"
  zone = "us-east1-b"
  tags = ["configmgmt"]
  boot_disk {
    initialize_params {
    image = "rootlevel-puppet-master"
  }
}
# Network Insterface
network_interface {
  network = "default"
  access_config {
  }

}
service_account {
   scopes = "${var.api-scopes}"
  }
}
#####################################################################
# Firewall Rules for specific Tags
#####################################################################
resource "google_compute_firewall" "default" {
  name    = "allow-default-ssh"
  network = "default"
  project = "testing-docker-v1"

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }
}

resource "google_compute_firewall" "allow-ssh" {
  name    = "allow-ssh"
  network = "default"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22", "80", "443"]
  }

   source_ranges = ["0.0.0.0/0"]
}

# Execute locally to check if server is running
# gcloud compute instances list
