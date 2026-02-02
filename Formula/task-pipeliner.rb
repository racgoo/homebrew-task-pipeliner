class TaskPipeliner < Formula
  desc "A task pipeline runner with condition-based workflow execution"
  homepage "https://task-pipeliner.racgoo.com"
  license "MIT"
  version "0.2.8"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/racgoo/task-pipeliner/releases/download/v0.2.8/tp-macos-arm64"
      sha256 "7caba0763c018c9c568392bd2c494f2f30f155cce506add209ea60eaa95c694a"
    else
      url "https://github.com/racgoo/task-pipeliner/releases/download/v0.2.8/tp-macos-x64"
      sha256 "b1603bb3bc2ebc2d5ae3f32357311d0083e35d03b5584da164ed455889dd4a89"
    end
  end
  
  on_linux do
    url "https://github.com/racgoo/task-pipeliner/releases/download/v0.2.8/tp-linux-x64"
    sha256 "f9e41c98b78b13b5aff75a04b0fd30aa9d383622a3b08fd37eb3b210982630b7"
  end
  
  def install
    bin.install Dir["tp-*"].first => "tp"
    bin.install_symlink "tp" => "task-pipeliner"
  end
  
  test do
    system "#{bin}/tp", "--version"
  end
end
