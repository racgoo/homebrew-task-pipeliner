class TaskPipeliner < Formula
  desc "A task pipeline runner with condition-based workflow execution"
  homepage "https://task-pipeliner.racgoo.com"
  license "MIT"
  version "0.3.6"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/racgoo/task-pipeliner/releases/download/v0.3.6/tp-macos-arm64"
      sha256 "78848aa483042590a28b0f36ac150c2ec486a5f9b6268e90c79097c9adfd2703"
    else
      url "https://github.com/racgoo/task-pipeliner/releases/download/v0.3.6/tp-macos-x64"
      sha256 "0afc163b5bbed03224fea7365798d0d75b04b23d0e1d747b22d0c5cbe1d3553f"
    end
  end
  
  on_linux do
    url "https://github.com/racgoo/task-pipeliner/releases/download/v0.3.6/tp-linux-x64"
    sha256 "c5303a9468038dda315aba90599cda247fc7ce44542eda097844199e04413d19"
  end
  
  def install
    bin.install Dir["tp-*"].first => "tp"
    bin.install_symlink "tp" => "task-pipeliner"
  end
  
  test do
    system "#{bin}/tp", "--version"
  end
end
