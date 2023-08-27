# Using JSON with docker compose

Turns out you can use JSON with docker compose! It's a bit lengthier than YAML, but you don't have to deal with weird whitespace issues wasting half an hour of your time. Here's an example of a docker compose file in JSON:

```json
{
  "version": "3.8",
  "services": {
    "nginx": {
      "image": "nginx:alpine",
      "ports": [
        "8080:80"
      ],
      "volumes": [
        "./html:/usr/share/nginx/html"
      ]
    }
  }
}
```

To use it, just run `docker-compose -f docker-compose.json up` instead of `docker-compose up`. Or you can just write the JSON in `docker-compose.yaml` like a madman. It'll work, though if you do that, you're definitely a psychopath /s

P.S. If you want a GUI for it, then I'd recommend using [aleiepure/devtoolbox](https://github.com/aleiepure/devtoolbox) to convert JSON to YAML and vice-versa. It's also got a JSON formatter and a *ton* of other tools, so I'd definitely recommend installing it anyways.
