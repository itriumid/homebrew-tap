cask "honk" do
  version "0.2.0"
  sha256 "4faffa2d9c910479b1f245d3c4af34461dac4e11d8aac7c9ce8faa1b9b42a85a"

  url "https://github.com/itriumid/honk/releases/download/v#{version}/Honk_#{version}_universal.dmg"
  name "Honk"
  desc "Soundboard with global hotkeys and a menu bar popover"
  homepage "https://github.com/itriumid/honk"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "Honk.app"

  zap trash: [
    "~/Library/Application Support/id.itrium.honk",
    "~/Library/Application Support/id.zakir.honk",
    "~/Library/Caches/honk",
    "~/Library/Caches/id.itrium.honk",
    "~/Library/Caches/id.zakir.honk",
    "~/Library/Saved Application State/id.itrium.honk.savedState",
    "~/Library/WebKit/honk",
    "~/Library/WebKit/id.itrium.honk",
    "~/Library/WebKit/id.zakir.honk",
  ]

  caveats <<~EOS
    Honk isn't signed by a verified developer, so macOS blocks it the first time you open it.
    Either click Open Anyway in System Settings > Privacy & Security, or remove the quarantine
    flag:

      xattr -dr com.apple.quarantine #{appdir}/Honk.app

    Details: https://github.com/itriumid/honk#honk-isnt-signed-so-your-system-will-warn-you-the-first-time
  EOS
end
