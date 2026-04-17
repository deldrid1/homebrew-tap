class Beehiiv < Formula
  desc "Cross-platform Beehiiv API CLI"
  homepage "https://github.com/deldrid1/beehiiv-cli"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deldrid1/beehiiv-cli/releases/download/v0.2.0/beehiiv_0.2.0_darwin_arm64.tar.gz"
      sha256 "9ad4e4821b234d07ae48f25086bf5dab7baf0cdc4aed06956560cde639f8ff64"
    else
      url "https://github.com/deldrid1/beehiiv-cli/releases/download/v0.2.0/beehiiv_0.2.0_darwin_x86_64.tar.gz"
      sha256 "09beab5f5496df57dd234ca399b920c0aa16b7e6f400f0a9ca00cf02f566e53d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deldrid1/beehiiv-cli/releases/download/v0.2.0/beehiiv_0.2.0_linux_arm64.tar.gz"
      sha256 "477342b561f472f4127fb79d40c68560593652e09a957f35399d7d9bb3f2bed5"
    else
      url "https://github.com/deldrid1/beehiiv-cli/releases/download/v0.2.0/beehiiv_0.2.0_linux_x86_64.tar.gz"
      sha256 "0e0353a42f976e17b828a061bd00a5a1ec97994c7b4fb3719a4d63b3ef280737"
    end
  end

  def install
    bin.install "beehiiv"
    man1.install Dir["share/man/man1/*.1"]
    bash_completion.install "share/completions/beehiiv.bash" => "beehiiv"
    fish_completion.install "share/completions/beehiiv.fish"
    zsh_completion.install "share/completions/_beehiiv"
  end

  test do
    assert_match "beehiiv version", shell_output("#{bin}/beehiiv version")
  end
end
