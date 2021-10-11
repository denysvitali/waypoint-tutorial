project = "rust-gcp"

app "web" {
    build {
        use "docker" {}
        registry {
          use "docker" {
            image = "gcr.io/awesome-aurora-241410/rust-gcp" 
            tag = "latest"
          }
        }
    }

    # Deploy to Docker
    deploy {
        use "google-cloud-run" {
          project = "awesome-aurora-241410"
          location = "europe-west6" # Zurich

          capacity {
            memory = 64
            cpu_count = 1
          }

          auto_scaling {
            max = 5
          }
        }
    }

    release {
      use "google-cloud-run" {}
    }
}
