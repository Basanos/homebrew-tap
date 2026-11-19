cask "crucible" do
  version "0.9.7"
  sha256 "ca72f2f34537f12f0f29d4c23b7a2bf96a4531fba8a8f699eda1447d8a37bbba"

  # Public download URL served by the Basanos download Worker (never the private
  # GitHub release asset, which is auth-gated). Version-PINNED route so url+sha256
  # stay immutable per cask version; the Worker 302-redirects (GET and HEAD alike)
  # to the signed release asset. The "latest" route /download/crucible/macos stays
  # for the website download buttons.
  url "https://basanos.io/download/crucible/#{version}/macos",
      verified: "basanos.io/"
  name "Crucible"
  desc "Intercepting proxy and attack suite for testing LLM applications"
  homepage "https://basanos.io/"

  # Universal (arm64 + x86_64) build. The app's real floor is macOS 12.0
  # (Info.plist LSMinimumSystemVersion), which macOS enforces at launch. A
  # numeric depends_on is redundant here — Homebrew's own supported-macOS floor
  # is already >= that — so just require macOS and let the bundle gate the rest.
  depends_on :macos

  app "Crucible.app"
end
