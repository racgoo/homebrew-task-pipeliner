class TaskPipeliner < Formula
  desc "A task pipeline runner with condition-based workflow execution"
  homepage "https://task-pipeliner.racgoo.com"
  license "MIT"
  version "0.2.15"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/racgoo/task-pipeliner/releases/download/v0.2.15/tp-macos-arm64"
      sha256 "c4760154324a576ab4bba5bb400b72bde914a55a4ac1a6d5eb3023a504318c64"
    else
      url "https://github.com/racgoo/task-pipeliner/releases/download/v0.2.15/tp-macos-x64"
      sha256 "17e2382e13e0cc9dcc35c57c821efc75a3d13631b1e02936bd54a497df0c1b36"
    end
  end
  
  on_linux do
    url "https://github.com/racgoo/task-pipeliner/releases/download/v0.2.15/tp-linux-x64"
    sha256 "eb08ef694e73065faa0123bc8ba9833b5e8d2cfbb2a38922d08188413336772a"
  end
  
  def install
    bin.install Dir["tp-*"].first => "tp"
    bin.install_symlink "tp" => "task-pipeliner"
  end
  
  test do
    system "#{bin}/tp", "--version"
  end
end
