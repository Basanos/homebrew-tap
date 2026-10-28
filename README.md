# Basanos Homebrew tap

Homebrew tap for [Basanos](https://basanos.io) tools.

## Crucible

Crucible — "Burp Suite for LLMs": an intercepting proxy and jailbreak/IPI
attack engine for red-teaming AI systems.

```sh
brew install --cask basanos/tap/crucible
```

Upgrades then arrive through `brew upgrade --cask crucible`.

> **Note:** Crucible is not yet notarized or Developer-ID signed, so macOS
> Gatekeeper will block the first launch. Clear the quarantine flag with
> `xattr -dr com.apple.quarantine "/Applications/Crucible.app"`, or right-click
> the app in Finder and choose **Open**. Signing is a planned follow-up.

## What a tap is

A tap is just a public Git repo of Homebrew formulae/casks. `brew tap
basanos/tap` maps to `github.com/Basanos/homebrew-tap`; the cask definitions
live under `Casks/`.
