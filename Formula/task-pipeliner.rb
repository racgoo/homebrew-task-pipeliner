class TaskPipeliner < Formula
  desc "A task pipeline runner with condition-based workflow execution"
  homepage "https://task-pipeliner.racgoo.com"
  license "MIT"
  version "0.3.5"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/racgoo/task-pipeliner/releases/download/v0.3.5/tp-macos-arm64"
      sha256 "000674f061ae123d953415521a6828e41921befe4e32470e60234cb00454780f"
    else
      url "https://github.com/racgoo/task-pipeliner/releases/download/v0.3.5/tp-macos-x64"
      sha256 "66b338ccebe339361a1c08d26d16b15c4b3e327600e4654099f62bfc91c053ec"
    end
  end
  
  on_linux do
    url "https://github.com/racgoo/task-pipeliner/releases/download/v0.3.5/tp-linux-x64"
    sha256 "369d35f232cad6e8f366afb7928f1c8c85d5b7d7ce1ec4cbf9d3bbf4a3e4d85e"
  end
  
  def install
    bin.install Dir["tp-*"].first => "tp"
    bin.install_symlink "tp" => "task-pipeliner"
  end
  
  test do
    system "#{bin}/tp", "--version"
  end
end
