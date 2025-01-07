# This page is portable

This page, even with its images, fonts, and javascript, is completely portable, and will work offline with no other files.

---

This is essentially a showcase and writeup about [One Webpage, Under God](https://git.askiiart.net/askiiart/one-webpage-under-god), a program I made to make a page completely portable and independent of any other files. It doesn't handle everything, but does perfectly on a simple static site like my own, with images, fonts, and javascript, it works perfectly.

```rs
let hello = "hiiiiiiiiii";
// Check out this fancy code block without using any other files
```

![I can even have this picture of a turtle in here](/assets/askiiart.avif)

## Okay but how

Really, this page should be titled "All hail the [Data URI Scheme](https://en.wikipedia.org/wiki/Data_URI_scheme) and whoever came up with it, that's how this entire program works. If you're unaware, a data URI looks like this:

```txt
data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAA
```

To break this down:

- `data:` This is a data URI
- `image/png`: The [MIME type](https://developer.mozilla.org/en-US/docs/Web/HTTP/MIME_types/Common_types) of the data
- `;base64` Indicates that this is encoded in base64 (optional, see [MDN docs](https://developer.mozilla.org/en-US/docs/Web/URI/Schemes/data))
- `iVBORw0KGgoAAAANSUhEUgAAAA`: base64-encoded data

If it's text data, then it can use percent-encoding instead, though I couldn't get this to work, so I just encoded everything in base64 instead.

## Fonts

The rest of all this is really simple - we just replace the link to the asset with a data URI. Fonts, however, are more complicated. They're linked in the CSS, not the HTML, which leads to *this* mess - fonts encoded in base64, inside of CSS which is then itself encoded in base64.

```css
@font-face {
        /* from https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/FiraCode */
        font-family: "FiraCode";
        src: 'FiraCode', url('data:font/woff2;base64,d09GMgABAA...76Ufr9TLXi4DgAA');
}
```

This also led to me being reminded how huge my fonts are; because of them my site's homepage comes out to nearly 2 MiB even without `prism.js`, which contains a duplicate FiraCode Nerd Font, which is of course also hardcoded in.

---

One last thing: Relative links are very *not* portable of course, so I just tacked on this bit to the end to fix that

```py
links = soup.find_all('link')
for item in links:
    if 'stylesheet' not in item.attrs['rel'] and 'icon' not in item.attrs['rel']:
        item.attrs['href'] = absolute_url(item.attrs['href'], domain_thing)
```

Oh also, this page is actually *not* portable - aside from the johnvertisement iframe at the bottom, I didn't make it portable regardless because it's 3+ MiB, and I didn't want to put that kind of load on my internet connection for no reason. If it weren't for my upload speed suddenly sexdecupling (16x) for some reason, it would take more than a second to load. The *actually portable* version is [here](/blog/this-page-is-actually-portable.html)
