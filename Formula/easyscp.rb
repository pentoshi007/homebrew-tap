class Easyscp < Formula
  desc "Send, receive and copy files over SSH by picking them, not typing paths"
  homepage "https://github.com/pentoshi007/easySCP"
  version "0.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pentoshi007/easySCP/releases/download/v0.2.1/easyscp-darwin-arm64.gz"
      sha256 "39bae951ace4f5aac3e71ed72bb2c62821112700cb6a9bf6a66e1a72de95d08c"
    end
    on_intel do
      url "https://github.com/pentoshi007/easySCP/releases/download/v0.2.1/easyscp-darwin-x64.gz"
      sha256 "89dd89522b8c9c38ec96a35d077e4bf85c864d8fca6fe587ec57f35d64b6c6f1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pentoshi007/easySCP/releases/download/v0.2.1/easyscp-linux-arm64.gz"
      sha256 "d52e62543e2200405fe44aec4e59f4d6b6fb44e32c338263c5f1493cd067e067"
    end
    on_intel do
      url "https://github.com/pentoshi007/easySCP/releases/download/v0.2.1/easyscp-linux-x64.gz"
      sha256 "0ffb5e00d1d4373ccc51e749d8cf9f2120dd3debf733a49ef6ba5b0adbd1e4c5"
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
