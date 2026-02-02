class TaskPipeliner < Formula
  desc "A task pipeline runner with condition-based workflow execution"
  homepage "https://task-pipeliner.racgoo.com"
  license "MIT"
  version "0.2.7"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/racgoo/task-pipeliner/releases/download/v0.2.7/tp-macos-arm64"
      sha256 "1ab4784cb448a220c6521e65414a789289b0e02c49d3409e082d5a18d156caeb"
    else
      url "https://github.com/racgoo/task-pipeliner/releases/download/v0.2.7/tp-macos-x64"
      sha256 "d6b170db4715abc422254a6d2ff557d829ca997da89c29d6f3a1625170129f14"
    end
  end
  
  on_linux do
    url "https://github.com/racgoo/task-pipeliner/releases/download/v0.2.7/tp-linux-x64"
    sha256 "3cdb40e3e4fce8ce78c480fe48231ad1f096a820d786e4e5401492600abbb7c2"
  end
  
  def install
    bin.install Dir["tp-*"].first => "tp"
    bin.install_symlink "tp" => "task-pipeliner"
  end
  
  test do
    system "#{bin}/tp", "--version"
  end
end
