# Authoritative cask for Planroom. Regenerated on every tag by the
# build.yml workflow in pdlc-os/Planroom, which substitutes the real sha256
# of the released DMG. Do not hand-edit: a release will overwrite it.
#
# Until the first release is tagged, sha256 is :no_check and the download
# URL below has nothing to resolve to.
cask "planroom" do
  version "2.8.0"
  sha256 :no_check # the tap's generated copy carries the real digest

  url "https://github.com/pdlc-os/Planroom/releases/download/v#{version}/Planroom-#{version}-arm64.dmg",
      verified: "github.com/pdlc-os/Planroom/"

  name "Planroom"
  desc "Native macOS viewer for Microsoft Project (.mpp) files"
  homepage "https://github.com/pdlc-os/Planroom"

  depends_on macos: :sonoma

  app "Planroom.app"

  postflight do
    # Remove quarantine attributes recursively so the unsigned app
    # and its bundled JRE can launch without Gatekeeper blocking
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Planroom.app"],
                   sudo: true
  end

  zap trash: [
    "~/Library/Caches/com.planroom.Planroom",
    "~/Library/Preferences/com.planroom.Planroom.plist",
    "~/Library/Saved Application State/com.planroom.Planroom.savedState",
  ]
end
