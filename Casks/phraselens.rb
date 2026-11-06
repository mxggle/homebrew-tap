cask "phraselens" do
  version "0.17.1"
  sha256 "9fe7af295a2ffd51fdce5fc2b2f791647b9974f2550e98acadb6c99ff3b2b4cf"

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
