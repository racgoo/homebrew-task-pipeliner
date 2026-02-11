class TaskPipeliner < Formula
  desc "A task pipeline runner with condition-based workflow execution"
  homepage "https://task-pipeliner.racgoo.com"
  license "MIT"
  version "0.3.12"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/racgoo/task-pipeliner/releases/download/v0.3.12/tp-macos-arm64"
      sha256 "958f7a5ccf64b3908622c1a25524f2dea797a4d3a780fd76fdb990ff4233bef6"
    else
      url "https://github.com/racgoo/task-pipeliner/releases/download/v0.3.12/tp-macos-x64"
      sha256 "e33aa719a52ae1c68010b13a880e86a5526397691ccf8409c4d0af9390a606eb"
    end
  end
  
  on_linux do
    url "https://github.com/racgoo/task-pipeliner/releases/download/v0.3.12/tp-linux-x64"
    sha256 "5c2d0b90574e2bd313a5652b69abf2fabca8b1f8785941080d77ba54071053ff"
  end
  
  def install
    bin.install Dir["tp-*"].first => "tp"
    bin.install_symlink "tp" => "task-pipeliner"
  end
  
  test do
    system "#{bin}/tp", "--version"
  end
end
