cask "honk" do
  version "0.3.1"
  sha256 "44109946bd2f25867c0d96cb84b67ec67ec9a7a0b88d8f8eb8a4f31ae65db086"

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
