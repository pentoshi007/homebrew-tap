class Easyscp < Formula
  desc "Send, receive and copy files over SSH by picking them, not typing paths"
  homepage "https://github.com/pentoshi007/easySCP"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pentoshi007/easySCP/releases/download/v0.1.1/easyscp-darwin-arm64.gz"
      sha256 "243ca3e1bb67a6e116d092fb59425604a2a2e15490bb7b12e8cc505b5108cd62"
    end
    on_intel do
      url "https://github.com/pentoshi007/easySCP/releases/download/v0.1.1/easyscp-darwin-x64.gz"
      sha256 "782f68ab67b6a020c30551c69f45e628dd09a4723260a17e177c2e7fb7ad60e6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pentoshi007/easySCP/releases/download/v0.1.1/easyscp-linux-arm64.gz"
      sha256 "f117e10d82be59d3eeb289b9f0aedaac527138e3b3f114474c2f3e21244838da"
    end
    on_intel do
      url "https://github.com/pentoshi007/easySCP/releases/download/v0.1.1/easyscp-linux-x64.gz"
      sha256 "146ca75f79b8ff889af9a0d53637e4bb287abc7f5d40a779b138445890cf8092"
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
