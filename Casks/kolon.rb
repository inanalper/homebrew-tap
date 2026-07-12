cask "kolon" do
  version "0.2.0"

  on_arm do
    sha256 "e77e66ee79cbcececeac33b62d15caf137151ee46eae12755a50a85c5ce5fba5"
    url "https://github.com/inanalper/Kolon/releases/download/v#{version}/Kolon-#{version}-arm64.zip"
  end
  on_intel do
    sha256 "0d2521b94a19807dd8a9fb57cbac9bacf2385d7c6db49753b82d756f0327d6b1"
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
