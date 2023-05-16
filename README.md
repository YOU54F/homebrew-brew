# homebrew-pact

The Pact public homebrew tap for MacOS/Linux homebrew formulae.

The easier way to install the Pact bundle of tools on your MacOS/Linux machine using Homebrew.

- [`pact-ruby-standalone`](https://github.com/pact-foundation/pact-ruby-standalone)
- [`pact_mock_server_cli`](https://github.com/pact-foundation/pact-reference)
- [`pact_verifier_cli`](https://github.com/pact-foundation/pact-reference)
<!-- - [`pact-plugin-cli`](https://github.com/pact-foundation/pact-plugins) -->

## Installation

Tap the repo, and then pick a tool, and pick your version

```sh
    brew tap you54f/pact
```

```sh
    brew tap-info you54f/pact --json | jq -r '.[].formula_names|.[] | sort -nr'
```

Install latest major versions

```sh
    brew install you54f/pact/pact-ruby-standalone@1
```

```sh
    brew install you54f/pact/pact-ruby-standalone@2
``


Install version specific

```sh
    brew install you54f/pact/pact-ruby-standalone-1.92.0
```

```sh
    brew install you54f/pact/pact_verifier_cli-0.10.6
```

```sh
    brew install you54f/pact/pact_mock_server_cli-1.0.0
```

# pact-ruby-standalone

## Installation

### Latest Stable

```sh
brew install you54f/pact/pact-ruby-standalone-1.92.0
```

### Latest Beta

```sh
brew install you54f/pact/pact-ruby-standalone-2.2.1
```

## Included tools

```lisp
├── pact
├── pactflow
├── pact-broker
├── pact-message
├── pact-plugin-cli
├── pact-mock-service
├── pact-stub-service
└── pact-provider-verifier
```

## Standalone versions

See [`./PACT_RUBY_STANDALONE_VERSIONS.md`](./PACT_RUBY_STANDALONE_VERSIONS.md) for full matrix

## Supported Platforms

| OS          | Architecture  | Supported  | Version    |
| -------     | ------------  | ---------  | ---------- |
| OSX         |     x86_64    |     ✅     |    all     |
| Linux       |     x86_64    |     ✅     |    all     |
| OSX         |     arm64     |     ✅     |   >= 2     |
| Linux       |    aarch64    |     ✅     |   >= 2     |
| Linux       |      x86      |     ⚠️      | <= 1.88.90 |

## Ruby Runtime Versions

| Ruby Version  | Pact-Ruby-Standalone Version  |
| ------------- | --------------------------    |
|    3.1.2      |           >= 2                |
|    2.4.10     |       >= 1.89.00 && < 2       |
|    2.2        |          <=1.88.90            |

## Notes

For versions less than `2.x`.

OSX ARM (M1/M2) Machines will require Rosetta tools, as the Ruby binaries as currently built for x86_64.

If you don't already have it installed, you can use the following command

```sh
sudo softwareupdate --install-rosetta --agree-to-license
```
