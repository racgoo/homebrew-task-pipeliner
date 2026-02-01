class TaskPipeliner < Formula
  desc "A task pipeline runner with condition-based workflow execution"
  homepage "https://task-pipeliner.racgoo.com"
  license "MIT"
  version "0.2.5"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/racgoo/task-pipeliner/releases/download/v0.2.5/tp-macos-arm64"
      sha256 "3c0591dae0f02686a32a11866d1c4777e14b812e74347aff5db2443549e8961c"
    else
      url "https://github.com/racgoo/task-pipeliner/releases/download/v0.2.5/tp-macos-x64"
      sha256 "88099218b5eb0155703b06c5cbe7cb1f385447f63d45984db9439b4e8257a0ab"
    end
  end
  
  on_linux do
    url "https://github.com/racgoo/task-pipeliner/releases/download/v0.2.5/tp-linux-x64"
    sha256 "5f126b820396b790f229758c91c0a1fe248df5bab95697942dbaa02471311b03"
  end
  
  def install
    bin.install Dir["tp-*"].first => "tp"
    bin.install_symlink "tp" => "task-pipeliner"
  end
  
  test do
    system "#{bin}/tp", "--version"
  end
end
