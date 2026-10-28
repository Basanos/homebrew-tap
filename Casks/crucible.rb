cask "crucible" do
  version "0.9.3"
  sha256 "66425367488e91e84449f17036cbba69a73387d3064ab04acdbf41572660600c"

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

  caveats <<~EOS
    Crucible is not yet notarized or Developer-ID signed, so on first launch
    macOS Gatekeeper will refuse to open it. To clear the quarantine flag:

      xattr -dr com.apple.quarantine "#{appdir}/Crucible.app"

    or right-click Crucible in Finder and choose Open, then confirm once.

    Signing/notarization is a planned follow-up; this caveat goes away then.
  EOS
end
