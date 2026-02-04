class TaskPipeliner < Formula
  desc "A task pipeline runner with condition-based workflow execution"
  homepage "https://task-pipeliner.racgoo.com"
  license "MIT"
  version "0.2.16"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/racgoo/task-pipeliner/releases/download/v0.2.16/tp-macos-arm64"
      sha256 "a563fcd417ac2ed61dfb04b31d7dc88db6a8790399246bf4d1fc432f267e70e0"
    else
      url "https://github.com/racgoo/task-pipeliner/releases/download/v0.2.16/tp-macos-x64"
      sha256 "52984deec6306b99c1c87478621988924022059b96837a3aaa1052c3688017f1"
    end
  end
  
  on_linux do
    url "https://github.com/racgoo/task-pipeliner/releases/download/v0.2.16/tp-linux-x64"
    sha256 "7ab773315bb0b0e12aa3278da6e0d4a6b8d954cc8985bb1e0b418b2c589d158c"
  end
  
  def install
    bin.install Dir["tp-*"].first => "tp"
    bin.install_symlink "tp" => "task-pipeliner"
  end
  
  test do
    system "#{bin}/tp", "--version"
  end
end
