#####################################################################
# Google Cloud Platform
#####################################################################
provider "google" {
    credentials = "${file("C:/Users/singh/OneDrive/Documents/GoogleCloudPlatform/Development/access-keys/google-cloud-terraform-key.json")}"
    project = "testing-docker-v1"
    region = "us-east1"
}
