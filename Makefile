CURL=curl -s -S -L

DEPENDENCIES=\
			leaflet\
			leaflet-custom\
			require.js\
			klass.js\
			mocha\
			roundup\
			Markdown.pl\
			SBT

all: $(DEPENDENCIES)

clean:
	rm -rf $(DEPENDENCIES)
	rm -rf leaflet-src

# A whole GitHub repo
roundup:
	mkdir -p $@
	$(CURL) https://github.com/bmizerany/roundup/tarball/v0.0.5 | tar xf - --strip-components 1 -C $@
	
# zip file hosted somewhere on the internetz

leaflet:
	$(CURL) http://leaflet-cdn.s3.amazonaws.com/build/leaflet-0.7.zip -o $@.download.zip
	unzip -q $@.download.zip -d leaflet
	rm $@.download.zip

# Single file from a zip file
Markdown.pl:
	$(CURL) http://daringfireball.net/projects/downloads/Markdown_1.0.1.zip -o $@.download.zip
	unzip -qj $@.download.zip Markdown_1.0.1/Markdown.pl
	rm $@.download.zip

# custom build from zip file

leaflet-custom: leaflet-src
	cp -r leaflet-src/dist/ $@

leaflet-src:
	mkdir -p $@
	$(CURL) https://codeload.github.com/Leaflet/Leaflet/tar.gz/v0.7|tar xf - --strip-components 1 -C $@
	cd $@; npm install; node_modules/.bin/jake build[lvs0025]

# Single GitHub file without tag

klass.js:
	$(CURL) -o $@ https://raw.github.com/ded/klass/c33b3c8114/klass.js

# Single GitHub file, tagged

require.js:
	$(CURL) -o $@ https://raw.github.com/jrburke/requirejs/2.1.9/require.js

# GitHub releases

mocha:
	mkdir -p $@
	$(CURL) https://codeload.github.com/visionmedia/mocha/tar.gz/1.14.0|tar xf - --strip-components 1 -C $@

# Scala SBT	
SBT_VERSION=0.13.8

sbt: sbt-$(SBT_VERSION)
	ln -sf sbt-$(SBT_VERSION)/bin/sbt sbt
	touch $@

sbt-$(SBT_VERSION):
	mkdir -p $@
	curl -s -S -L https://dl.bintray.com/sbt/native-packages/sbt/$(SBT_VERSION)/sbt-$(SBT_VERSION).tgz | tar xf - --strip-components 1 -C $@
