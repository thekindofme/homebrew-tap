cask "margin" do
  arch arm: "aarch64"

  version "0.1.0"
  # Placeholder: the release workflow (homebrew.yml in the margin repo) fills in the real checksum.
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

  url "https://github.com/thekindofme/margin/releases/download/v#{version}/Margin_#{version}_#{arch}.dmg"
  name "Margin"
  desc "Local-first AI meeting notes"
  homepage "https://margin.yasithfernando.com/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Margin.app"
  binary "#{appdir}/Margin.app/Contents/MacOS/margin-cli", target: "margin"

  zap trash: [
    "~/Library/Application Support/Margin",
    "~/Library/Caches/com.yasithfernando.margin",
    "~/Library/Preferences/com.yasithfernando.margin.plist",
    "~/Library/Saved Application State/com.yasithfernando.margin.savedState",
  ]
end
