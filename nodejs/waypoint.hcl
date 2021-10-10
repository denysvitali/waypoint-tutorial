# The name of your project. A project typically maps 1:1 to a VCS repository.
# This name must be unique for your Waypoint server. If you're running in
# local mode, this must be unique to your machine.
project = "simple-node-app"

app "web" {
    build {
        use "pack" {}
    }

    deploy {
        use "docker" {
          service_port = 8081
        }
    }
}
