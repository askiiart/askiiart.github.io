# Akkoma in Docker

Okay, so first of all, it doesn't work when running inside the container as root. You can run the Docker daemon as root, but if you're the root you'll have to change it up a bit to use some other UID/GID, not 0 and 0.

Besides that, Akkoma's documentation isn't quite complete. Some commands are missing a Docker version in the docs. But running it in Docker is the same as running it from source, it's just, well, in Docker.

So for "from source" commands, to use them in Docker, you just prepend `./docker-resources/manage.sh`. For example...

```bash
mix pleroma.user invite
```

...would instead become...

```bash
./docker-resources/manage.sh mix pleroma.user invite
```

Other than those minor issues, you can just follow the docs.
