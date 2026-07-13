cask "kolon" do
  version "0.2.3"

  on_arm do
    sha256 "ddd8a5c7d69cb1c884a749b9e5ebb0abd64352f1ac7bc4c68425e573d040fa6d"
    url "https://github.com/inanalper/Kolon/releases/download/v#{version}/Kolon-#{version}-arm64.zip"
  end
  on_intel do
    sha256 "b7154afee67c2482bbeb5e50555b72e15430e880061e88aecd083d03dc8a032a"
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
