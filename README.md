# Basanos Homebrew tap

Homebrew tap for [Basanos](https://basanos.io) tools.

## Crucible

Crucible is an intercepting proxy and attack suite for red-teaming AI systems.
It sits between your application and the model API it calls, so you can capture,
modify and replay that traffic.

```sh
brew install --cask basanos/tap/crucible
```

Upgrades then arrive through `brew upgrade --cask crucible`.

## What a tap is

A tap is just a public Git repo of Homebrew formulae/casks. `brew tap
basanos/tap` maps to `github.com/Basanos/homebrew-tap`; the cask definitions
live under `Casks/`.
