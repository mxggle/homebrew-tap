cask "phraselens" do
  version "0.10.0"
  sha256 "3ea465d97d63a482881fca16ef87b6281386e95e3fa99f50e8256d5cec614eab"

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
