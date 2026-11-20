cask "milkrice" do
  arch arm: "aarch64"

  version "0.1.0"
  # Placeholder: the release workflow (homebrew.yml in the milkrice repo) fills in the real checksum.
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

  url "https://github.com/thekindofme/milkrice/releases/download/v#{version}/Milkrice_#{version}_#{arch}.dmg"
  name "Milkrice"
  desc "Local-first AI meeting notes"
  homepage "https://milkrice.yasithfernando.com/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Milkrice.app"
  binary "#{appdir}/Milkrice.app/Contents/MacOS/milkrice-cli", target: "milkrice"

  zap trash: [
    "~/Library/Application Support/Margin",
    "~/Library/Application Support/Milkrice",
    "~/Library/Caches/com.yasithfernando.margin",
    "~/Library/Caches/com.yasithfernando.milkrice",
    "~/Library/Preferences/com.yasithfernando.margin.plist",
    "~/Library/Preferences/com.yasithfernando.milkrice.plist",
    "~/Library/Saved Application State/com.yasithfernando.milkrice.savedState",
  ]
end
