class TaskPipeliner < Formula
  desc "A task pipeline runner with condition-based workflow execution"
  homepage "https://task-pipeliner.racgoo.com"
  license "MIT"
  version "0.3.7"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/racgoo/task-pipeliner/releases/download/v0.3.7/tp-macos-arm64"
      sha256 "3d7c0e848716293e16006ea59e5fdc061beda36d16927de9f1e97432525260c2"
    else
      url "https://github.com/racgoo/task-pipeliner/releases/download/v0.3.7/tp-macos-x64"
      sha256 "a6c92901f61a6c74a1f0493b29cb1cf4c7c10abd23bd986d9fdc6eef22d214cd"
    end
  end
  
  on_linux do
    url "https://github.com/racgoo/task-pipeliner/releases/download/v0.3.7/tp-linux-x64"
    sha256 "f9a98855033366d305d3204aecac5c0d928631d5a5a5c9bd0ff77e63362cd8a4"
  end
  
  def install
    bin.install Dir["tp-*"].first => "tp"
    bin.install_symlink "tp" => "task-pipeliner"
  end
  
  test do
    system "#{bin}/tp", "--version"
  end
end
