cask "kolon" do
  version "0.1.0"
  sha256 "8b617790185f8d689d8d975a9ca3b1bc318a97af45557dc05201360762388998"

  url "https://github.com/inanalper/Kolon/releases/download/v#{version}/Kolon-#{version}.zip"
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
