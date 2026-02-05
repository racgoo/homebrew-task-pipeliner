class TaskPipeliner < Formula
  desc "A task pipeline runner with condition-based workflow execution"
  homepage "https://task-pipeliner.racgoo.com"
  license "MIT"
  version "0.3.3"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/racgoo/task-pipeliner/releases/download/v0.3.3/tp-macos-arm64"
      sha256 "1a186e9be37f994bc156672b7287fd9c2085ec29fae81561e9b747bc4cd28b32"
    else
      url "https://github.com/racgoo/task-pipeliner/releases/download/v0.3.3/tp-macos-x64"
      sha256 "f034d72e7a81bddb5359b4cdb76053d5f4289233dea4aaaa8909d872b9d66170"
    end
  end
  
  on_linux do
    url "https://github.com/racgoo/task-pipeliner/releases/download/v0.3.3/tp-linux-x64"
    sha256 "68b18bf5c157b2276e5d75f771e3507d29dc03057dbea21c045e0cdb5fe17280"
  end
  
  def install
    bin.install Dir["tp-*"].first => "tp"
    bin.install_symlink "tp" => "task-pipeliner"
  end
  
  test do
    system "#{bin}/tp", "--version"
  end
end
