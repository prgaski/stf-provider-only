# Standalone STF provider

STF with non-provider stuff stripped out to make it simpler to build and improve.

Fixes can still be cherry-picked over it; the actual JS files are mostly untouched.

Supported architectures:
- x86_64
- arm64
- armhf

Host deps:
- cmake (during `npm install` for jpeg-turbo build if napi prebuilts aren't compatible)
- yasm (during `npm install` for jpeg-turbo build if napi prebuilts aren't compatible)
