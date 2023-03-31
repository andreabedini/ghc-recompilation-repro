# Repro for "why is the output not changing?!?"

Tested with ghc-9.4.4 and cabal 3.10.1.0, I haven't tested other versions.

```
❯ cabal clean
❯ cat pkg-a/src/MyLibA.hs
module MyLibA where

someFuncA :: IO ()
someFuncA =
  putStrLn "Bring Sally down ..."
❯ cabal run pkg-b
Resolving dependencies...
Build profile: -w ghc-9.4.4 -O0
In order, the following will be built (use -v for more details):
 - pkg-a-0.1.0.0 (lib) (first run)
 - pkg-b-0.1.0.0 (lib) (first run)
 - pkg-b-0.1.0.0 (exe:pkg-b) (first run)
Configuring library for pkg-a-0.1.0.0..
Preprocessing library for pkg-a-0.1.0.0..
Building library for pkg-a-0.1.0.0..
[1 of 1] Compiling MyLibA           ( src/MyLibA.hs, /home/andrea/temp/dist-newstyle/build/x86_64-linux/ghc-9.4.4/pkg-a-0.1.0.0/noopt/build/MyLibA.o, /home/andrea/temp/dist-newstyle/build/x86_64-linux/ghc-9.4.4/pkg-a-0.1.0.0/noopt/build/MyLibA.dyn_o )
Configuring library for pkg-b-0.1.0.0..
Preprocessing library for pkg-b-0.1.0.0..
Building library for pkg-b-0.1.0.0..
[1 of 1] Compiling MyLibB           ( src/MyLibB.hs, /home/andrea/temp/dist-newstyle/build/x86_64-linux/ghc-9.4.4/pkg-b-0.1.0.0/noopt/build/MyLibB.o, /home/andrea/temp/dist-newstyle/build/x86_64-linux/ghc-9.4.4/pkg-b-0.1.0.0/noopt/build/MyLibB.dyn_o )
Configuring executable 'pkg-b' for pkg-b-0.1.0.0..
Preprocessing executable 'pkg-b' for pkg-b-0.1.0.0..
Building executable 'pkg-b' for pkg-b-0.1.0.0..
[1 of 1] Compiling Main             ( app/Main.hs, /home/andrea/temp/dist-newstyle/build/x86_64-linux/ghc-9.4.4/pkg-b-0.1.0.0/x/pkg-b/noopt/build/pkg-b/pkg-b-tmp/Main.o )
[2 of 2] Linking /home/andrea/temp/dist-newstyle/build/x86_64-linux/ghc-9.4.4/pkg-b-0.1.0.0/x/pkg-b/noopt/build/pkg-b/pkg-b
Bring Sally down ...
Bring Sally down ...
❯ ./switch.sh
renamed 'pkg-a/src/MyLibA.hs' -> 'pkg-a/src/MyLibA.hs.down'
renamed 'pkg-a/src/MyLibA.hs.up' -> 'pkg-a/src/MyLibA.hs'
❯ cabal run pkg-b
Build profile: -w ghc-9.4.4 -O0
In order, the following will be built (use -v for more details):
 - pkg-a-0.1.0.0 (lib) (file src/MyLibA.hs changed)
 - pkg-b-0.1.0.0 (lib) (dependency rebuilt)
 - pkg-b-0.1.0.0 (exe:pkg-b) (dependency rebuilt)
Preprocessing library for pkg-a-0.1.0.0..
Building library for pkg-a-0.1.0.0..
[1 of 1] Compiling MyLibA           ( src/MyLibA.hs, /home/andrea/temp/dist-newstyle/build/x86_64-linux/ghc-9.4.4/pkg-a-0.1.0.0/noopt/build/MyLibA.o, /home/andrea/temp/dist-newstyle/build/x86_64-linux/ghc-9.4.4/pkg-a-0.1.0.0/noopt/build/MyLibA.dyn_o ) [Source file changed]
Preprocessing library for pkg-b-0.1.0.0..
Building library for pkg-b-0.1.0.0..
Preprocessing executable 'pkg-b' for pkg-b-0.1.0.0..
Building executable 'pkg-b' for pkg-b-0.1.0.0..
Bring Sally down ...
Bring Sally down ...
❯ cat pkg-a/src/MyLibA.hs
module MyLibA where

someFuncA :: IO ()
someFuncA =
  putStrLn "Bring Sally up ..."
❯ echo "¯\_(ツ)_/¯"
¯\_(ツ)_/¯
```
