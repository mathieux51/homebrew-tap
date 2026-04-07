cask "vimtico" do
  version "2026.4.7.6"
  sha256 "cd6381f95e706002b22b686d637cec5b59db81ac5b5967500ada3d8a53e35881"

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
