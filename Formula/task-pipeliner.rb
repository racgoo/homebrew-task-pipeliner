class TaskPipeliner < Formula
  desc "A task pipeline runner with condition-based workflow execution"
  homepage "https://task-pipeliner.racgoo.com"
  license "MIT"
  version "0.3.11"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/racgoo/task-pipeliner/releases/download/v0.3.11/tp-macos-arm64"
      sha256 "2228e190ff341c787ea9eb56bbbb2048eb6ef245420d4240fd4c781bdc1b6edd"
    else
      url "https://github.com/racgoo/task-pipeliner/releases/download/v0.3.11/tp-macos-x64"
      sha256 "f6875ea35926d8d7f657055d591881103b30fb0dc8d3ed7117d2dbf5486ffe02"
    end
  end
  
  on_linux do
    url "https://github.com/racgoo/task-pipeliner/releases/download/v0.3.11/tp-linux-x64"
    sha256 "ca93bf5e557eef60f21083d8e0a07f911cba0294d69d99a2e2cb738570d35ccc"
  end
  
  def install
    bin.install Dir["tp-*"].first => "tp"
    bin.install_symlink "tp" => "task-pipeliner"
  end
  
  test do
    system "#{bin}/tp", "--version"
  end
end
