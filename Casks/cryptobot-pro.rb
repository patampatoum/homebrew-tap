cask "cryptobot-pro" do
  version "3.0.6"

  on_arm do
    sha256 "18ed918e349bc3d4939204541b5d39e4856656ed2f55349ec9726f6fb09ac48e"

    url "https://github.com/patampatoum/cryptobot-pro-releases/releases/download/v#{version}/CryptoBot-Pro-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "0a2fec231473454264d4f19cc028ac5e5df288bc49e06367e12ad2ef165bf802"

    url "https://github.com/patampatoum/cryptobot-pro-releases/releases/download/v#{version}/CryptoBot-Pro-#{version}.dmg"
  end

  name "CryptoBot Pro"
  desc "BTC/USDC spot grid trading bot with a local engine"
  homepage "https://gribbot-btc-usdc.netlify.app/"

  depends_on macos: :monterey

  app "CryptoBot Pro.app"

  zap trash: [
    "~/Library/Application Support/cryptobot-pro",
    "~/Library/Preferences/com.cryptobotpro.tradingbot.plist",
    "~/Library/Saved Application State/com.cryptobotpro.tradingbot.savedState",
  ]

  caveats <<~EOS
    CryptoBot Pro is not signed or notarized. Homebrew quarantines the download,
    and the quarantine flag stops the trading engine inside the app: the window
    opens but Start does nothing. After every install and every upgrade, run:
      xattr -dr com.apple.quarantine "/Applications/CryptoBot Pro.app"

    If macOS still blocks the launch, click Done (not Move to Trash), open
    System Settings > Privacy & Security, scroll down to Security, click
    Open Anyway and confirm with Touch ID or your password. On macOS 15 and
    later, right-click > Open no longer works.

    The update banner in the app links to the GitHub releases page. Ignore that
    link: quit the app (Cmd-Q) and upgrade with:
      brew update && brew upgrade --cask patampatoum/tap/cryptobot-pro

    brew uninstall --zap moves ~/Library/Application Support/cryptobot-pro to the
    Trash. That folder holds your exchange API keys and the database that tracks
    open orders. Stop the plan and cancel open BUY orders first.

    Every feature is free for 90 days, then a paid subscription is required.
  EOS
end
