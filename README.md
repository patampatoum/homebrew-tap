# homebrew-tap

Homebrew tap for CryptoBot Pro, a desktop BTC/USDC spot grid trading bot for Apple Silicon and Intel Macs on macOS 12 Monterey or later. Every feature is free for 90 days, then a paid subscription is required.

## Install

    brew install --cask patampatoum/tap/cryptobot-pro
    xattr -dr com.apple.quarantine "/Applications/CryptoBot Pro.app"

The app is not signed or notarized. Homebrew quarantines the download, and the quarantine flag stops the trading engine inside the app: the window opens but Start does nothing. Run the xattr line after every install and every upgrade.

If macOS still blocks the launch, click Done (not Move to Trash), then open System Settings > Privacy & Security, scroll down to Security and click Open Anyway. On macOS 15 and later, right-click > Open no longer works.

Already installed from the dmg? Add `--force` to the install command. Your settings in ~/Library/Application Support/cryptobot-pro are kept.

## Upgrade

The cask is updated after each release. The update banner in the app links to the GitHub releases page; if you installed with Homebrew, quit the app (Cmd-Q) and upgrade with brew instead:

    brew update && brew upgrade --cask patampatoum/tap/cryptobot-pro
    xattr -dr com.apple.quarantine "/Applications/CryptoBot Pro.app"

## Uninstall

    brew uninstall --cask cryptobot-pro

`brew uninstall --zap` also moves ~/Library/Application Support/cryptobot-pro to the Trash. That folder holds your exchange API keys and the database that tracks open orders. Stop the plan and cancel open BUY orders first.

Website: https://gribbot-btc-usdc.netlify.app
Releases: https://github.com/patampatoum/cryptobot-pro-releases
