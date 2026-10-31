cask "phraselens" do
  version "0.16.0"
  sha256 "b9c7170ec11cf1cacaee400ad6cef683d0341d0bcdd3f9bfe50de9b631e17ca7"

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
