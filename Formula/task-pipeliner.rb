class TaskPipeliner < Formula
  desc "A task pipeline runner with condition-based workflow execution"
  homepage "https://task-pipeliner.racgoo.com"
  license "MIT"
  version "0.3.8"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/racgoo/task-pipeliner/releases/download/v0.3.8/tp-macos-arm64"
      sha256 "7e8cef74314efd16ace4bc472ac8dedc324ce9e93943824b00d2e3c60088696c"
    else
      url "https://github.com/racgoo/task-pipeliner/releases/download/v0.3.8/tp-macos-x64"
      sha256 "83b8e24eabdcdfbe875bd3e933872664b199cf79e35e3ef36822e5788712a225"
    end
  end
  
  on_linux do
    url "https://github.com/racgoo/task-pipeliner/releases/download/v0.3.8/tp-linux-x64"
    sha256 "39c9188d7ac9d3e8ca5f844f8d93eb4f70be06aef29e499bb2bcc50589548a42"
  end
  
  def install
    bin.install Dir["tp-*"].first => "tp"
    bin.install_symlink "tp" => "task-pipeliner"
  end
  
  test do
    system "#{bin}/tp", "--version"
  end
end
