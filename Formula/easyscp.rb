class Easyscp < Formula
  desc "Send, receive and copy files over SSH by picking them, not typing paths"
  homepage "https://github.com/pentoshi007/easySCP"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pentoshi007/easySCP/releases/download/v0.2.0/easyscp-darwin-arm64.gz"
      sha256 "0d093cfe3f4d09be936f7129e57df12bad547ad7cf416015b816b1081fc4df89"
    end
    on_intel do
      url "https://github.com/pentoshi007/easySCP/releases/download/v0.2.0/easyscp-darwin-x64.gz"
      sha256 "24a83a87d4bb444d554ec14eae59c31e47cb86a62e8a73ec7419f916d1b60656"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pentoshi007/easySCP/releases/download/v0.2.0/easyscp-linux-arm64.gz"
      sha256 "513c8c1b4676a2a23bf1c23a6326f4d962136b7809b0e2d0a97034d80dbdf244"
    end
    on_intel do
      url "https://github.com/pentoshi007/easySCP/releases/download/v0.2.0/easyscp-linux-x64.gz"
      sha256 "1d05e6a76bb575674b209b0a9467adf1fa37faab5695b03baadc929f509863f9"
    end
  end

  def install
    executable = Dir["easyscp-*"].first
    chmod 0755, executable
    bin.install executable => "easyscp"
    bin.install_symlink "easyscp" => "escp"
    generate_completions_from_executable(bin/"easyscp", "completion")
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/easyscp --version").strip
    assert_match "compdef", shell_output("#{bin}/escp completion zsh")
  end
end
