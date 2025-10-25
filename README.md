# homebrew-pact-standalone

The Pact Standalone public homebrew tap for MacOS / Linux homebrew formulae.

The easier way to install the [`pact-cli`](https://github.com/YOU54F/pact-cli) & legacy [`pact-standalone`](https://github.com/pact-foundation/pact-standalone) bundle of tools on your macOS/Linux machine using Homebrew.

## Installation

    brew tap pact-foundation/pact-standalone
    brew install pact

or in a single line

    brew install pact-foundation/pact-standalone/pact

##  Supported Platforms

| OS      | Architecture | Supported |
| ------- | ------------ | --------- |
| OSX     | x86_64       | ✅        |
| OSX     | arm64        | ✅        |
| Linux   | x86_64       | ✅        |
| Linux   | arm64        | ✅        |

## Included tools

- broker       A Rust and CLI client for the Pact Broker. Publish and retrieve pacts and     verification  results.
- pactflow     PactFlow specific commands
- completions  Generates completion scripts for your shell
- extension    Manage Pact CLI extensions
- plugin       CLI utility for Pact plugins
- mock         Standalone Pact mock server
- verifier     Standalone pact verifier for provider pact verification
- stub         Pact Stub Server 0.7.0
- help         Print this message or the help of the given subcommand(s)

```

├── pact (central entry point to all binaries)
├── pact broker
├── pact pactflow
├── pact plugin
├── pact mock
├── pact stub
├── pact verifier
├── pact completions
├── pact stub
└── pact extension
```

### Pact Ruby Standalone (Legacy)

The following command can be used to install the pact ruby standalone bundle which is now in maintainence mode.

```sh
  brew tap pact-foundation/pact-standalone
  brew install pact-standalone
```

### Included legacy tools

```
├── pact-broker-legacy
├── pactflow-legacy
├── pact-message-legacy
├── pact-mock-service-legacy
├── pact-provider-verifier-legacy
└── pact-stub-service-legacy
```
