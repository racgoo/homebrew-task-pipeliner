class TaskPipeliner < Formula
  desc "A task pipeline runner with condition-based workflow execution"
  homepage "https://task-pipeliner.racgoo.com"
  license "MIT"
  version "0.3.0"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/racgoo/task-pipeliner/releases/download/v0.3.0/tp-macos-arm64"
      sha256 "f1c26f5788aaf9bcf9330848013df7ad137b63687520425c8f53edcba88ca8e8"
    else
      url "https://github.com/racgoo/task-pipeliner/releases/download/v0.3.0/tp-macos-x64"
      sha256 "5865d7b00b4bd91e997e6930bfe2431af9842076bfbcba949cd4faeb6529df90"
    end
  end
  
  on_linux do
    url "https://github.com/racgoo/task-pipeliner/releases/download/v0.3.0/tp-linux-x64"
    sha256 "9d5223ab14af4937deb984154425ac0a242660771def94a4f6e9082a7ceeb6c6"
  end
  
  def install
    bin.install Dir["tp-*"].first => "tp"
    bin.install_symlink "tp" => "task-pipeliner"
  end
  
  test do
    system "#{bin}/tp", "--version"
  end
end
