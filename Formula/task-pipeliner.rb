class TaskPipeliner < Formula
  desc "A task pipeline runner with condition-based workflow execution"
  homepage "https://task-pipeliner.racgoo.com"
  license "MIT"
  version "0.3.14"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/racgoo/task-pipeliner/releases/download/v0.3.14/tp-macos-arm64"
      sha256 "7c4c90889853cac69309e30184bb7dfc90ed25172fcc4559e61e5b8eea032521"
    else
      url "https://github.com/racgoo/task-pipeliner/releases/download/v0.3.14/tp-macos-x64"
      sha256 "e5e93e8907f6f12efc3bb7f284292d856eb76ae8b43a0ff03c436522f88a3643"
    end
  end
  
  on_linux do
    url "https://github.com/racgoo/task-pipeliner/releases/download/v0.3.14/tp-linux-x64"
    sha256 "ae17cb0cb26e1b4dcdfdc7aa102b8dc04e664e63424238b3f8928b44a2e4fd2e"
  end
  
  def install
    bin.install Dir["tp-*"].first => "tp"
    bin.install_symlink "tp" => "task-pipeliner"
  end
  
  test do
    system "#{bin}/tp", "--version"
  end
end
