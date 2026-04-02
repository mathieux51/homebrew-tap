cask "vimtico" do
  version "2026.4.2.21"
  sha256 "07d698dec585c7967b417d58e650744a2e37ac5fdfb810fd6e9cede6b7292e78"

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
