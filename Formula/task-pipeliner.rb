class TaskPipeliner < Formula
  desc "A task pipeline runner with condition-based workflow execution"
  homepage "https://task-pipeliner.racgoo.com"
  license "MIT"
  version "0.2.12"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/racgoo/task-pipeliner/releases/download/v0.2.12/tp-macos-arm64"
      sha256 "f55ee902ec4d813d9e8a19e8fa57718881ba7122eb1fc35f9214e74f6587f7e7"
    else
      url "https://github.com/racgoo/task-pipeliner/releases/download/v0.2.12/tp-macos-x64"
      sha256 "c2137589f61f6b4942333e92bf709733b01dd56827d5703a6ed25c9eca33a387"
    end
  end
  
  on_linux do
    url "https://github.com/racgoo/task-pipeliner/releases/download/v0.2.12/tp-linux-x64"
    sha256 "c06059ac73af9b265085712593876b3cb38d0a34c8fd78ef59f0e8624a10ae55"
  end
  
  def install
    bin.install Dir["tp-*"].first => "tp"
    bin.install_symlink "tp" => "task-pipeliner"
  end
  
  test do
    system "#{bin}/tp", "--version"
  end
end
