// Configure the Google Cloud provider
provider "google" {
 credentials = "${file("credential.json")}"
 project     = "terraform01-310909"
 region      = "us-west1"
 zone        = "us-west1-b"
}