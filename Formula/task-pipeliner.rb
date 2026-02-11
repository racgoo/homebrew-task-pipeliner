class TaskPipeliner < Formula
  desc "A task pipeline runner with condition-based workflow execution"
  homepage "https://task-pipeliner.racgoo.com"
  license "MIT"
  version "0.3.14"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/racgoo/task-pipeliner/releases/download/v0.3.14/tp-macos-arm64"
      sha256 "bde27ed333a1f7be0cf8c899ac43bfa030ea9e65195672a41a30e617213ce664"
    else
      url "https://github.com/racgoo/task-pipeliner/releases/download/v0.3.14/tp-macos-x64"
      sha256 "7283c626e1b992a5457004c8368b55222cf693527682d38ef338248162ffdfa7"
    end
  end
  
  on_linux do
    url "https://github.com/racgoo/task-pipeliner/releases/download/v0.3.14/tp-linux-x64"
    sha256 "db4d075007ca2af00f5aef4bb584dc026bc83e04a9f90773b4afcf898ae3c21c"
  end
  
  def install
    bin.install Dir["tp-*"].first => "tp"
    bin.install_symlink "tp" => "task-pipeliner"
  end
  
  test do
    system "#{bin}/tp", "--version"
  end
end
