# container-transform
# Install On Centos 8 or RHEL
```bash
cd /
yum install -y epel-release
yum install -y python3-pip
pip3 install git+git://github.com/spf913/container-transform.git

git clone https://github.com/spf913/tidb-docker-compose.git
cd tidb-docker-compose
# kubernetes (always use "docker-compose.yml" filename, as need rename file)
container-transform -i compose -o kubernetes docker-compose.yml
# MARATHON (always use "docker-compose.yml" filename, as need rename file)
container-transform -i compose -o marathon docker-compose.yml


Usage: container-transform [OPTIONS] [INPUT_FILE]

  container-transform is a small utility to transform various docker
  container formats to one another.

  Default input type is compose, default output type is ECS

  Default is to read from STDIN if no INPUT_FILE is provided

  All options may be set by environment variables with the prefix "CT_"
  followed by the full argument name.

Options:
  -i, --input-type [ecs|compose|marathon|chronos|kubernetes]
  -o, --output-type [ecs|compose|systemd|marathon|chronos|kubernetes]
  -v, --verbose / --no-verbose    Expand/minify json output
  -q, --quiet                     Silence error messages
  --version                       Show the version and exit.
  -h, --help                      Show this message and exit.
```
# Build Docker Container
```bash
docker build .
docker tag <image_ID> your_repo/container-transform
docker login
docker push your_repo/container-transform
```
# Generate Template
```bash
git clone https://github.com/spf913/tidb-docker-compose.git
cd tidb-docker-compose
docker run --rm -v $(pwd):/data/ your_repo/container-transform -o marathon docker-compose.yml
```
