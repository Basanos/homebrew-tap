cask "crucible" do
  version "0.9.8"
  sha256 "b11715720497aa9fc806db802668cc4f2b4946814cf417f7ab9c7a1c2c204221"

  # Public download URL served by the Basanos download Worker (never the private
  # GitHub release asset, which is auth-gated). Version-PINNED route so url+sha256
  # stay immutable per cask version; the Worker 302-redirects (GET and HEAD alike)
  # to the signed release asset. The "latest" route /download/crucible/macos stays
  # for the website download buttons.
  url "https://basanos.io/download/crucible/#{version}/macos",
      verified: "basanos.io/"
  name "Crucible"
  desc "Burp Suite for LLMs: intercepting proxy + jailbreak/IPI attack engine"
  homepage "https://basanos.io/"

  # Universal (arm64 + x86_64) build. The app's real floor is macOS 12.0
  # (Info.plist LSMinimumSystemVersion), which macOS enforces at launch. A
  # numeric depends_on is redundant here — Homebrew's own supported-macOS floor
  # is already >= that — so just require macOS and let the bundle gate the rest.
  depends_on :macos

  app "Crucible.app"
end
