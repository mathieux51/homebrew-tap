cask "vimtico" do
  version "2026.4.8.1"
  sha256 "d07bb58f097d05d49b8edf8cdaca06316e79c7e0e41018862a5d62008ba8c70a"

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
