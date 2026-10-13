class Easyscp < Formula
  desc "Friendly, fast file transfers over SSH"
  homepage "https://github.com/pentoshi007/easySCP"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pentoshi007/easySCP/releases/download/v0.1.0/easyscp-darwin-arm64.gz"
      sha256 "e950d90d8b1bd32dd80ffa159effe6db9e7593b3a1900f3586c8bf813de183cc"
    end
    on_intel do
      url "https://github.com/pentoshi007/easySCP/releases/download/v0.1.0/easyscp-darwin-x64.gz"
      sha256 "f39193a9c2aef09f0d4d1dea84db4c8a5f0eafbefa6d354d38a50d1ee502824b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pentoshi007/easySCP/releases/download/v0.1.0/easyscp-linux-arm64.gz"
      sha256 "1b60b99ca5ab6d180717b34860d229534abc545fed09cb36f9ade1de56b96981"
    end
    on_intel do
      url "https://github.com/pentoshi007/easySCP/releases/download/v0.1.0/easyscp-linux-x64.gz"
      sha256 "6fafeb8a65aefe52264e920a5062e2113ad19b5dc5cbc02805b2f062770a8d75"
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
