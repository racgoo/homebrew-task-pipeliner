class TaskPipeliner < Formula
  desc "A task pipeline runner with condition-based workflow execution"
  homepage "https://task-pipeliner.racgoo.com"
  license "MIT"
  version "0.3.10"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/racgoo/task-pipeliner/releases/download/v0.3.10/tp-macos-arm64"
      sha256 "712d7bc4143b01d1b525deb521f65feb3e2d53adb454325db9bcb49f368e0414"
    else
      url "https://github.com/racgoo/task-pipeliner/releases/download/v0.3.10/tp-macos-x64"
      sha256 "ceffb4cdf773e887dc463e6087a024e85cfb4f6c8bd2671e65b81790f707ffce"
    end
  end
  
  on_linux do
    url "https://github.com/racgoo/task-pipeliner/releases/download/v0.3.10/tp-linux-x64"
    sha256 "700481724fd261d65a4a9e613b95743f75783caf1e9a43a1526212fb9e8b202e"
  end
  
  def install
    bin.install Dir["tp-*"].first => "tp"
    bin.install_symlink "tp" => "task-pipeliner"
  end
  
  test do
    system "#{bin}/tp", "--version"
  end
end
