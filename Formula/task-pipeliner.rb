class TaskPipeliner < Formula
  desc "A task pipeline runner with condition-based workflow execution"
  homepage "https://task-pipeliner.racgoo.com"
  license "MIT"
  version "0.3.9"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/racgoo/task-pipeliner/releases/download/v0.3.9/tp-macos-arm64"
      sha256 "8079cd430fd2bbf7861a531ee59506b310e54de42c4879d70280acc8997db6e0"
    else
      url "https://github.com/racgoo/task-pipeliner/releases/download/v0.3.9/tp-macos-x64"
      sha256 "3e183b27b8f76e7627ec0f2fa9c4bc8decde90b4a334f852929f0ce4cd6214b0"
    end
  end
  
  on_linux do
    url "https://github.com/racgoo/task-pipeliner/releases/download/v0.3.9/tp-linux-x64"
    sha256 "b592d2c41ec8d363a1497b433f070166bbbd9741460c24816a99c59d890a613d"
  end
  
  def install
    bin.install Dir["tp-*"].first => "tp"
    bin.install_symlink "tp" => "task-pipeliner"
  end
  
  test do
    system "#{bin}/tp", "--version"
  end
end
