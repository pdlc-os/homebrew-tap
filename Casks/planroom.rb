cask "planroom" do
  version "2.9.0"
  sha256 "f0449045193eec1a2b9b37aa01d3fc35dcc55a3e7425b4da48edee45e1b7f4cf"

  url "https://github.com/pdlc-os/Planroom/releases/download/v2.9.0/Planroom-#{version}-arm64.dmg",
      verified: "github.com/pdlc-os/Planroom/"

  name "Planroom"
  desc "Native macOS viewer for Microsoft Project (.mpp) files"
  homepage "https://github.com/pdlc-os/Planroom"

  depends_on macos: :sonoma

  app "Planroom.app"

  zap trash: [
    "~/Library/Caches/com.planroom.Planroom",
    "~/Library/Preferences/com.planroom.Planroom.plist",
    "~/Library/Saved Application State/com.planroom.Planroom.savedState",
  ]
end
