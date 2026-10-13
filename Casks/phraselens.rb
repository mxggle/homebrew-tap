cask "phraselens" do
  version "0.11.0"
  sha256 "222591328ffe141957e56f59c4287f3177a24e1ef97039c8b107be507e9480af"

  url "https://github.com/mxggle/phrase-lens/releases/download/v#{version}/PhraseLens.dmg"
  name "PhraseLens"
  desc "Native AI translation and language workspace"
  homepage "https://github.com/mxggle/phrase-lens"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :sonoma

  app "PhraseLens.app"

  zap trash: [
    "~/Library/Application Support/PhraseLens",
    "~/Library/Caches/com.harry.phraselens",
    "~/Library/HTTPStorages/com.harry.phraselens",
    "~/Library/HTTPStorages/com.harry.phraselens.binarycookies",
    "~/Library/Preferences/com.harry.phraselens.plist",
  ]

  caveats <<~EOS
    PhraseLens is not notarized yet, so macOS blocks the first launch.
    Approve it once in System Settings > Privacy & Security > Open Anyway.
  EOS
end
