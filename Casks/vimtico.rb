cask "vimtico" do
  version "2026.4.4.1"
  sha256 "181a9789c18a1d510905614583c9ed5b5cec42505b515b441e01ad84871ff0a2"

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
