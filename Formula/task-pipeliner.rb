class TaskPipeliner < Formula
  desc "A task pipeline runner with condition-based workflow execution"
  homepage "https://task-pipeliner.racgoo.com"
  license "MIT"
  version "0.3.4"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/racgoo/task-pipeliner/releases/download/v0.3.4/tp-macos-arm64"
      sha256 "cf505c23252ce5ec6268e998079078135bed2394084de02dd304e7f2c720ae86"
    else
      url "https://github.com/racgoo/task-pipeliner/releases/download/v0.3.4/tp-macos-x64"
      sha256 "73ee8c084bd674eafcd6bf3855eec940a706e07a8951c85a0f676576960de00e"
    end
  end
  
  on_linux do
    url "https://github.com/racgoo/task-pipeliner/releases/download/v0.3.4/tp-linux-x64"
    sha256 "2b851a48fb4f4f1a796eb94202f309fd68998845781f981044d142a91e1c7d08"
  end
  
  def install
    bin.install Dir["tp-*"].first => "tp"
    bin.install_symlink "tp" => "task-pipeliner"
  end
  
  test do
    system "#{bin}/tp", "--version"
  end
end
