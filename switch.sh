#!/bin/sh

if [[ -f pkg-a/src/MyLibA.hs.up ]]; then
  mv -v "pkg-a/src/MyLibA.hs" "pkg-a/src/MyLibA.hs.down"
  mv -v "pkg-a/src/MyLibA.hs.up" "pkg-a/src/MyLibA.hs"
else
  mv -v "pkg-a/src/MyLibA.hs" "pkg-a/src/MyLibA.hs.up"
  mv -v "pkg-a/src/MyLibA.hs.down" "pkg-a/src/MyLibA.hs"
fi
