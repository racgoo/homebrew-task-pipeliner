class TaskPipeliner < Formula
  desc "A task pipeline runner with condition-based workflow execution"
  homepage "https://task-pipeliner.racgoo.com"
  license "MIT"
  version "0.2.3"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/racgoo/task-pipeliner/releases/download/v0.2.3/tp-macos-arm64"
      sha256 "d12df0b46bfa400038d1d4594d11743292e5de69e72894d5e8c79eb23c337baa"
    else
      url "https://github.com/racgoo/task-pipeliner/releases/download/v0.2.3/tp-macos-x64"
      sha256 "120027cf1b47b2d26737f0eb587d2b49e9b283cff9a706f35119f64599f247d5"
    end
  end
  
  on_linux do
    url "https://github.com/racgoo/task-pipeliner/releases/download/v0.2.3/tp-linux-x64"
    sha256 "0717587c65706f0d4b199fbdbd066fa95a69fa3a77367f20123023d3f3ae7051"
  end
  
  def install
    bin.install Dir["tp-*"].first => "tp"
    bin.install_symlink "tp" => "task-pipeliner"
  end
  
  test do
    system "#{bin}/tp", "--version"
  end
end
