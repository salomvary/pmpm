# The Poor Man's Package Manager For The Web

## Introducing pmpm

I started finding alternatives to "download by hand" package mangement
for my front-end projects a while ago. Not only because it's a cool
thing to do nowadays, but wanted to keep track of where I downloaded
what and make easy to switch versions.

Started with [Volojs] [1] which seemed to be able to install anything
from anywhere, but apparently [lost momentum][2] recently.

The other option seemed to be [Bower][3] which has a searchable
registry *and* able to install anything from anywhere.

But both failed for me partially because of [varoius][4] [bugs][5]
*and* I wanted more: I wanted custom builds. Although Bower has an
[open issue][6] to provide a post-build step they are [not
planning][7] to provide and maintain build scripts, it will always be
DIY.

## Make for the rescue!

- Proven technology since 1977 ✔
- Supports zip, tar.bz, tar.bz2, GithHub, HTTP, FTP, SFTP, and more ✔
- Few dependencies besides `make`: `curl`, `zip`, `tar` are usually
	available by default ✔
- Can install anything anywhere from the internetz ✔
- Easy versoning (just bump numbers in the url!) ✔
- Fast and lightweight ✔

## Example

Create a Makefile like this:

```Makefile
CURL=curl -s -S

DEPENDENCIES=require.js

all: $(DEPENDENCIES)

require.js:
	$(CURL) -o $@ https://raw.github.com/jrburke/requirejs/2.1.9/require.js

```
Run `make` and call it a day!

See the [example Makefile](Makefile) for more examples.

## FAQ

- Is this serious?
	- Yes.
- Supported operating systems?
	- Anything UNIX like with make, curl, zip and tar installed.
- Dependencies?
	- See above plus anything you need for custom builds (eg. node+npm).
- Should I check in dependencies?
	- It's [up to you][10], [gitignoring them](.gitignore) is always an
		option.

Inspired by [world-atlas Makefile][8] by mbostock and his [blog
post][9] on make.

Licensed under [WTFPL][11].

[1]: http://volojs.org/
[2]: https://github.com/volojs/volo/graphs/commit-activity
[3]: http://bower.io/
[4]: https://github.com/bower/bower/issues/915#issuecomment-27622835
[5]: https://github.com/volojs/volo/issues/174
[6]: https://github.com/bower/bower/issues/249
[7]: https://github.com/bower/bower/issues/369#issuecomment-15896861
[8]: https://github.com/mbostock/world-atlas/blob/master/Makefile
[9]: http://bost.ocks.org/mike/make/
[10]: http://addyosmani.com/blog/checking-in-front-end-dependencies/
[11]: http://en.wikipedia.org/wiki/WTFPL
