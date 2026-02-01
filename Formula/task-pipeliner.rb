class TaskPipeliner < Formula
  desc "A task pipeline runner with condition-based workflow execution"
  homepage "https://task-pipeliner.racgoo.com"
  license "MIT"
  version "0.2.3"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/racgoo/task-pipeliner/releases/download/v0.2.3/tp-macos-arm64"
      sha256 "8159f76180c3c00c48950896ac6664279eb3dc48e2c67eccd6e578c20db2c2db"
    else
      url "https://github.com/racgoo/task-pipeliner/releases/download/v0.2.3/tp-macos-x64"
      sha256 "10c5c6d705f22dac515f1541d955f0834a08c75d14cd11b55c9e921b35424f84"
    end
  end
  
  on_linux do
    url "https://github.com/racgoo/task-pipeliner/releases/download/v0.2.3/tp-linux-x64"
    sha256 "f0a4a43d3adee87c5deb5810e8f9e38a7b08aaa1de2af89408dadc99e2c25de7"
  end
  
  def install
    bin.install Dir["tp-*"].first => "tp"
    bin.install_symlink "tp" => "task-pipeliner"
  end
  
  test do
    system "#{bin}/tp", "--version"
  end
end
