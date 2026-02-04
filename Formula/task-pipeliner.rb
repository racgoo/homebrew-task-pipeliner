class TaskPipeliner < Formula
  desc "A task pipeline runner with condition-based workflow execution"
  homepage "https://task-pipeliner.racgoo.com"
  license "MIT"
  version "0.2.17"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/racgoo/task-pipeliner/releases/download/v0.2.17/tp-macos-arm64"
      sha256 "89436854c5d8ebd786ef38e7c2b8e8ed316b5adb0825b56ce476b7faebf31477"
    else
      url "https://github.com/racgoo/task-pipeliner/releases/download/v0.2.17/tp-macos-x64"
      sha256 "4b2e4b76f0d26d24dc0886b7603e8014808fc887d3556704e59b4bba1b70670c"
    end
  end
  
  on_linux do
    url "https://github.com/racgoo/task-pipeliner/releases/download/v0.2.17/tp-linux-x64"
    sha256 "fbe789277a8edfd353b9193f040061bc2a5389b75772b341ec04f75b989be1e4"
  end
  
  def install
    bin.install Dir["tp-*"].first => "tp"
    bin.install_symlink "tp" => "task-pipeliner"
  end
  
  test do
    system "#{bin}/tp", "--version"
  end
end
