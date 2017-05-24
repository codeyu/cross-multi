Cross Compilers in Docker
========

Inspired by [multiarch/crossbuild](https://github.com/multiarch/crossbuild).

Cross compilers for multiple platforms, including

* Linux with musl libc (based on [musl-cross-make](https://github.com/richfelker/musl-cross-make))
* Windows (based on MinGW)
* macOS (based on [osxcross](https://github.com/tpoechtrager/osxcross))

## Download pre-built compilers

Install docker and pull the image by `docker pull privatelo/cross-multi`.

## How to compile your own version

Clone the repo and run `make` to build. Run `make shell` to test the instance.

## Supported target triplets

- Linux
    * arm-linux-musleabihf
    * aarch64-linux-musl
    * mips-linux-musl
    * x86_64-linux-musl
    * i486-linux-musl
- macOS
    * x86_64-apple-darwin
    * x86_64h-apple-darwin
    * i386-apple-darwin
- Windows
    * x86_64-w64-mingw32
    * i686-w64-mingw32

## Legal note

For macOS builds, please ensure you have read and understood the
**[Xcode license terms](https://www.apple.com/legal/sla/docs/xcode.pdf)**
before continuing.

## Credits
  * https://github.com/andrew-d/docker-musl-cross-arm
  * https://github.com/tpoechtrager/osxcross
  * https://github.com/richfelker/musl-cross-make
  * https://github.com/multiarch/crossbuild
  * https://github.com/FiloSottile/homebrew-musl-cross

## License

BSD
