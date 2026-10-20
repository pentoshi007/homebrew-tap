class Easyscp < Formula
  desc "Send, receive and copy files over SSH by picking them, not typing paths"
  homepage "https://github.com/pentoshi007/easySCP"
  version "0.2.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pentoshi007/easySCP/releases/download/v0.2.2/easyscp-darwin-arm64.gz"
      sha256 "e8d35f12c611b3a57c9919bf2193b4707a532158676a1ae3b012cbede97b0c00"
    end
    on_intel do
      url "https://github.com/pentoshi007/easySCP/releases/download/v0.2.2/easyscp-darwin-x64.gz"
      sha256 "ec3b91e4baf1c360f7f29dbce0e80a026b7fbc041e495b9b970bd5d13f3f330a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pentoshi007/easySCP/releases/download/v0.2.2/easyscp-linux-arm64.gz"
      sha256 "a04f56e41281b4b7500cafd8e1e1e3468621eaadec1053e5b6b110e28716509f"
    end
    on_intel do
      url "https://github.com/pentoshi007/easySCP/releases/download/v0.2.2/easyscp-linux-x64.gz"
      sha256 "3c55aed358724c32a63f59444fbd0283733a32ad06dc169d6a58ee6fe4003305"
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
