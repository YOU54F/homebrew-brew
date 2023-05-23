# homebrew-pact

The Pact public homebrew tap for MacOS/Linux homebrew formulae.

The easier way to install the Pact bundle of tools on your MacOS/Linux machine using Homebrew.

- [`pact-ruby-standalone`](https://github.com/you54f/pact-ruby-standalone)
- [`pact_mock_server_cli`](https://github.com/you54f/pact-reference)
- [`pact_verifier_cli`](https://github.com/you54f/pact-reference)
<!-- - [`pact-plugin-cli`](https://github.com/you54f/pact-plugins) -->

## Installation

Tap the repo (Optional)

> If you choose not to tap the repo upfront, you'll need to prefix your install commands
> with the tap name. It will still be _tapped_. They are shown in full in this section 
> for ease of use

```sh
    brew tap you54f/pact
```

List all available formulas

```sh
    brew tap-info you54f/pact --json | jq -r '.[].formula_names|.[]' | sort -nr
```

Install your tool

### pact-ruby-standalone

```sh
    brew install you54f/pact/pact-ruby-standalone
```

### pact_mock_server_cli

```sh
    brew install you54f/pact/pact_mock_server_cli
```

### pact_verifier_cli

```sh
    brew install you54f/pact/pact_verifier_cli
```


## pact-ruby-standalone

Installation

### Install Latest

```sh
brew install you54f/pact/pact-ruby-standalone
```

### Install Major Tag

append `@<major_tag>` to the name

Latest `2.x`

```sh
brew install you54f/pact/pact-ruby-standalone@2
```

Latest `1.x`

```sh
brew install you54f/pact/pact-ruby-standalone@1
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
|    3.2.2      |           >= 2                |
|    2.4.10     |       >= 1.89.00 && < 2       |
|    2.2        |          <=1.88.90            |
