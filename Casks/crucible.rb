cask "crucible" do
  version "0.9.2"
  sha256 "cf4d4adda6e4327b68d3ec4743b7bf5d1bfc6d5cd76a86879e2bdd1188e34d4f"

  # Public download URL served by the Basanos download Worker (never the private
  # GitHub release asset, which is auth-gated). Version-PINNED route so url+sha256
  # stay immutable per cask version; the Worker 302-redirects (GET and HEAD alike)
  # to the signed release asset. The "latest" route /download/crucible/macos stays
  # for the website download buttons.
  url "https://basanos.io/download/crucible/#{version}/macos",
      verified: "basanos.io/"
  name "Crucible"
  desc "Burp Suite for LLMs: intercepting proxy + jailbreak/IPI attack engine"
  homepage "https://basanos.io"

  # Universal (arm64 + x86_64) build. eframe/egui floor is conservative here;
  # raise if a newer API is adopted.
  depends_on macos: ">= :big_sur"

  app "Crucible.app"

  caveats <<~EOS
    Crucible is not yet notarized or Developer-ID signed, so on first launch
    macOS Gatekeeper will refuse to open it. To clear the quarantine flag:

      xattr -dr com.apple.quarantine "#{appdir}/Crucible.app"

    or right-click Crucible in Finder and choose Open, then confirm once.

    Signing/notarization is a planned follow-up; this caveat goes away then.
  EOS
end
