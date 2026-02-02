class TaskPipeliner < Formula
  desc "A task pipeline runner with condition-based workflow execution"
  homepage "https://task-pipeliner.racgoo.com"
  license "MIT"
  version "0.2.13"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/racgoo/task-pipeliner/releases/download/v0.2.13/tp-macos-arm64"
      sha256 "1e9c3a6125f07fd38d9ff2e18ba463453666b5a29013626a73077964f2992a54"
    else
      url "https://github.com/racgoo/task-pipeliner/releases/download/v0.2.13/tp-macos-x64"
      sha256 "d3d3ba8780dc181c788cdbecd48a91a74b3f62f968c8b0421c0d54a49a8d3500"
    end
  end
  
  on_linux do
    url "https://github.com/racgoo/task-pipeliner/releases/download/v0.2.13/tp-linux-x64"
    sha256 "cd38ff55901e601e08155ffb75f1b39e692a87a6fced05a9c8efac024c12b90d"
  end
  
  def install
    bin.install Dir["tp-*"].first => "tp"
    bin.install_symlink "tp" => "task-pipeliner"
  end
  
  test do
    system "#{bin}/tp", "--version"
  end
end
