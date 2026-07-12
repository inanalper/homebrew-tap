cask "kolon" do
  version "0.2.1"

  on_arm do
    sha256 "17dbf01f1918833543235f8ceaadef6e8691bcf5bc484ce3c7e82e903a346fd9"
    url "https://github.com/inanalper/Kolon/releases/download/v#{version}/Kolon-#{version}-arm64.zip"
  end
  on_intel do
    sha256 "760d137d30fecd12a068eebb7db675b8cde403e43b1ebe278fbd62a0f9c065e4"
    url "https://github.com/inanalper/Kolon/releases/download/v#{version}/Kolon-#{version}-x86_64.zip"
  end
  name "Kolon"
  desc "Quick Look extension for Apache Parquet files"
  homepage "https://github.com/inanalper/Kolon"

  depends_on macos: :ventura

  app "Kolon.app"

  postflight do
    # Register the Quick Look extension without requiring a manual first launch
    lsregister = "/System/Library/Frameworks/CoreServices.framework/Versions/Current" \
                 "/Frameworks/LaunchServices.framework/Versions/Current/Support/lsregister"
    system_command lsregister, args: ["-f", "-R", "-trusted", "#{appdir}/Kolon.app"]
    system_command "/usr/bin/qlmanage", args: ["-r"]
  end

  zap trash: [
    "~/Library/Containers/dev.inanalper.Kolon",
    "~/Library/Containers/dev.inanalper.KolonQL",
  ]
end
