
#####################################################################
# Ngnix-webserver VM Instances
#####################################################################
# Assigne default scope values
variable "api-scopes" {
  default = []
  type    = "list"
}
# Create a new instance
resource "google_compute_instance" "ngnix-webserver-terraform" {
  name = "ngnix-webserver-terraform"
  machine_type = "f1-micro"
  zone = "us-east1-b"
  machine_type = "f1-micro"
  tags = ["webserver"]
  boot_disk {
    initialize_params {
    image = "rootlevel-ngnix-webserver"
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
  name    = "default-allow-http-https"
  network = "default"
  project = "testing-docker-v1"

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }
}

# Execute locally to check if server is running
# gcloud compute instances list
