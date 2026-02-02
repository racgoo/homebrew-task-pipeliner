class TaskPipeliner < Formula
  desc "A task pipeline runner with condition-based workflow execution"
  homepage "https://task-pipeliner.racgoo.com"
  license "MIT"
  version "0.2.10"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/racgoo/task-pipeliner/releases/download/v0.2.10/tp-macos-arm64"
      sha256 "0f87bf11f7e3f0f2ddc96ee8f3202059a3ccf30a0b284d912587f79cbe81177c"
    else
      url "https://github.com/racgoo/task-pipeliner/releases/download/v0.2.10/tp-macos-x64"
      sha256 "be9268e6c932a774fcc82473adfe4d71e6d81b62fa1292b637479337ecb36f91"
    end
  end
  
  on_linux do
    url "https://github.com/racgoo/task-pipeliner/releases/download/v0.2.10/tp-linux-x64"
    sha256 "86ce071efb684d55e656bd2397e4d11ef32de25a80623a2709405d9fc0414bb2"
  end
  
  def install
    bin.install Dir["tp-*"].first => "tp"
    bin.install_symlink "tp" => "task-pipeliner"
  end
  
  test do
    system "#{bin}/tp", "--version"
  end
end
