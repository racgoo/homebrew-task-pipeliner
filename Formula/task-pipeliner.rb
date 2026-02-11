class TaskPipeliner < Formula
  desc "A task pipeline runner with condition-based workflow execution"
  homepage "https://task-pipeliner.racgoo.com"
  license "MIT"
  version "0.3.13"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/racgoo/task-pipeliner/releases/download/v0.3.13/tp-macos-arm64"
      sha256 "0cda30fcfe9de9a7f0bcbfed745210359c0531f42779a9676e622a1ce857a9da"
    else
      url "https://github.com/racgoo/task-pipeliner/releases/download/v0.3.13/tp-macos-x64"
      sha256 "57050d73cc61a2e62f5261ee6c444ec5b12a2c61151635016b42fc78a6c4db52"
    end
  end
  
  on_linux do
    url "https://github.com/racgoo/task-pipeliner/releases/download/v0.3.13/tp-linux-x64"
    sha256 "388f739ebe53fcfa55999e0044504e63694478c7d9d5b81a407f82c06d704eb5"
  end
  
  def install
    bin.install Dir["tp-*"].first => "tp"
    bin.install_symlink "tp" => "task-pipeliner"
  end
  
  test do
    system "#{bin}/tp", "--version"
  end
end
