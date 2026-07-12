# homebrew-tap

Homebrew tap for [inanalper](https://github.com/inanalper)'s tools.

## Usage

```bash
brew install --cask inanalper/tap/kolon
```

| Cask | Description |
| --- | --- |
| [`kolon`](Casks/kolon.rb) | Quick Look extension for Apache Parquet files |

## Releasing a new Kolon version

1. In the [kolon](https://github.com/inanalper/Kolon) repo, run `./Scripts/package-release.sh <version>` — it builds, zips, and prints the sha256.
2. Create a GitHub release tagged `v<version>` and upload the generated `Kolon-<version>.zip`.
3. Update `version` and `sha256` in `Casks/kolon.rb` here and push.
