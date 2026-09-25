# Itrium's Homebrew tap

Homebrew casks for [Itrium](https://github.com/itriumid)'s free tools.

```sh
brew install itriumid/tap/honk
```

Homebrew taps this repository the first time you install from it. After that, `brew upgrade`
keeps everything here up to date along with the rest of your casks.

| Cask   | What it is                                                                                        |
| ------ | ------------------------------------------------------------------------------------------------- |
| `honk` | [Honk](https://github.com/itriumid/honk), a soundboard with global hotkeys and a menu bar popover |

## Our applications aren't signed yet

Signing certificates cost money every year, and our tools are free, so macOS can't verify who
made them and blocks them the first time you open one. Homebrew shows how to get past that when
the installation finishes: click **Open Anyway** in **System Settings → Privacy & Security**, or
remove the quarantine flag in Terminal. Each application's README explains it in more detail.

## Removing an application

```sh
brew uninstall honk          # removes the application and keeps your library
brew uninstall --zap honk    # also deletes your library and settings
```
