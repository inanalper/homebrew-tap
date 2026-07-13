cask "kolon" do
  version "0.3.0"

  on_arm do
    sha256 "0ad8dc983477e54de0815d616641f0f588b4ac0ed5958b174df967a08357700d"
    url "https://github.com/inanalper/Kolon/releases/download/v#{version}/Kolon-#{version}-arm64.zip"
  end
  on_intel do
    sha256 "a66935304aaa707deed3a50c0d116c342d112b47967e2442ab546682253dfcf6"
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
