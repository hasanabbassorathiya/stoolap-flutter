# Contributing to Stoolap Flutter SDK

We welcome contributions! As this is a high-performance FFI plugin, there are two main areas to contribute:

## 1. Rust Layer (`rust/`)
If you want to add low-level Stoolap features (new SQL functions, storage optimizations, or SIMD tweaks):
- You need a working Rust toolchain.
- Logic lives in `rust/src/api/`.
- After changes, run: `flutter_rust_bridge_codegen generate`.

## 2. Dart Layer (`lib/`)
For higher-level SDK ergonomics, reactive wrappers, or example app improvements:
- Standard Flutter development workflow.
- Ensure type safety with `StoolapValue`.

## Development Workflow
1. Fork the repo.
2. Create a feature branch.
3. If changing Rust code, regenerate bindings.
4. Add tests for your changes.
5. Submit a PR!

## Code of Conduct
Be respectful. Focus on performance and simplicity.

Anyone can use, modify, and distribute their own version under the Apache 2.0 license.
