build:
	podman build -t rec .

run:
  mkdir -p recordings
  podman rm -f rec || true
  podman run -d \
    --name rec \
    -p 8080:8080 \
    -v ./recordings:/recordings:Z \
    --restart unless-stopped \
    rec
  podman logs -f rec

rm:
  podman rm -f rec
