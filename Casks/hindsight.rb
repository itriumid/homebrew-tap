cask "hindsight" do
  version "0.2.0"
  sha256 "0a0669c20e1c48db7ad6f8abc78b8db1dbd1d7169fc95f1967b99175198f5f74"

  url "https://github.com/itriumid/hindsight/releases/download/v#{version}/Hindsight_#{version}_universal.dmg"
  name "Hindsight"
  desc "Keeps the last few minutes of audio in memory so you can save them"
  homepage "https://github.com/itriumid/hindsight"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "Hindsight.app"

  # Hindsight records from the menu bar, so it's quit before it's removed. Its launch agent,
  # created by "Start Hindsight when I log in", would otherwise be left pointing at a deleted app.
  # 0.1.0 named it "Hindsight"; later versions name it after the identifier.
  uninstall launchctl: [
              "Hindsight",
              "id.itrium.hindsight",
            ],
            quit:      "id.itrium.hindsight"

  zap trash: [
    "~/Library/Application Support/id.itrium.hindsight",
    "~/Library/Caches/hindsight",
    "~/Library/Caches/id.itrium.hindsight",
    "~/Library/HTTPStorages/id.itrium.hindsight",
    "~/Library/LaunchAgents/Hindsight.plist",
    "~/Library/LaunchAgents/id.itrium.hindsight.plist",
    "~/Library/Saved Application State/id.itrium.hindsight.savedState",
    "~/Library/WebKit/hindsight",
    "~/Library/WebKit/id.itrium.hindsight",
  ]

  caveats <<~EOS
    Hindsight isn't signed by a verified developer, so macOS blocks it the first time you open it.
    Either click Open Anyway in System Settings > Privacy & Security, or remove the quarantine
    flag:

      xattr -dr com.apple.quarantine #{appdir}/Hindsight.app

    macOS then asks whether Hindsight may use the microphone. Nothing is recorded before you
    finish its first-run screen.

    Details: https://itrium.id/hindsight
  EOS
end
