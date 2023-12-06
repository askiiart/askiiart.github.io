# 300 Addendum

Still not the movie. Still a nerd.

---

So let's figure out how to add the `Link` header for 300 Multiple Choices. As a reminder, [here's the spec](https://httpwg.org/specs/rfc9110.html#status.300):

> It is possible to communicate the list using a set of Link header fields *[RFC5988](https://httpwg.org/specs/rfc9110.html#RFC8288)*, each with a relationship of "alternate", though deployment is a chicken-and-egg problem.

So based off some examples for the `Link` header in general on [Mozilla's docs](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Link), and for 300 `Link` headers specifically [on http.dev](https://http.dev/300), this is how you make the `Link` headers for a 300:

```txt
Link: </relative/link/like/this>; rel="alternate"
Link: <https://site-one.net/blah/blah/blah>; rel="alternate"
```

Unfortunately, there doesn't seem to be an option for specifying a preferred choice in the `Link` header. So I'll just set mine to these:

```txt
Link: <https://git.askiiart.net/askiiart/askiiart-net>; rel="alternate"
Link: <https://github.com/askiiart/askiiart.github.io>; rel="alternate"
```

And so here's the new nginx config:

```language-nginx
    location  /.git {
        add_header Location "https://git.askiiart.net/askiiart/askiiart-net";
        add_header Link '<https://git.askiiart.net/askiiart/askiiart-net>; rel="alternate"; "';
        add_header Link '<https://github.com/askiiart/askiiart.github.io>; rel="alternate"; "';
        return 300 '<!DOCTYPE html><html lang="en"><head><meta charset="utf-8"></head><body><a href="https://git.askiiart.net/askiiart/askiiart-net">Self-hosted</a><br><a href="https://github.com/askiiart/askiiart-net">GitHub</a></body></html>';
    }
```

[Main post](/blog/300.html)
