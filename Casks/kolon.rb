cask "kolon" do
  version "0.2.2"

  on_arm do
    sha256 "8bc196da332303007dda5fff248e070c5d9034a50ad87a04ecbf396d9b54e4ed"
    url "https://github.com/inanalper/Kolon/releases/download/v#{version}/Kolon-#{version}-arm64.zip"
  end
  on_intel do
    sha256 "bb02dff60668f1c581cb9f490fb8b0040ad9253c7930a01c4fae8a15106e1296"
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
