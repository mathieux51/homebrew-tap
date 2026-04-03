cask "vimtico" do
  version "2026.4.3.5"
  sha256 "fa696bba09a853fd40ffd4a6b442bfa403dbd4923b7d23b130febb8884ee99e1"

  url "https://github.com/mathieux51/vimtico/releases/download/v#{version}/Vimtico-#{version}.dmg"
  name "Vimtico"
  desc "Native macOS PostgreSQL client with Vim mode and Nord theme"
  homepage "https://github.com/mathieux51/vimtico"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sonoma"

  app "Vimtico.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Vimtico.app"]
  end

  zap trash: [
    "~/.config/vimtico",
    "~/Library/Preferences/com.mathieux51.Vimtico.plist",
    "~/Library/Application Support/Vimtico",
  ]
end
