workflow "Build images" {
  on = "push"
  resolves = ["Build PHP7 versions", "Build 5.6"]
}

action "Build PHP7 versions" {
  uses = "actions/docker/cli@c08a5fc9e0286844156fefff2c141072048141f6"
  args = "docker build --no-cache -t jorge07/alpine-php:7.3 -f 7.3/Dockerfile 7.3/"
}

action "Build 5.6" {
  uses = "actions/docker/cli@c08a5fc9e0286844156fefff2c141072048141f6"
  runs = "docker build --no-cache -t jorge07/alpine-php:5.6 -f 5.6/Dockerfile 5.6/"
}
