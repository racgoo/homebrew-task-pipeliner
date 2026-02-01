class TaskPipeliner < Formula
  desc "A task pipeline runner with condition-based workflow execution"
  homepage "https://task-pipeliner.racgoo.com"
  license "MIT"
  version "0.2.6"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/racgoo/task-pipeliner/releases/download/v0.2.6/tp-macos-arm64"
      sha256 "e12edfe405e4cee96a300bf940a86075d78b085df50f0bf3964bf4c1547b130b"
    else
      url "https://github.com/racgoo/task-pipeliner/releases/download/v0.2.6/tp-macos-x64"
      sha256 "b6a2f143e3b2748cad2da02165e25d235cb6706eb56994cf70ff57de6dbc195b"
    end
  end
  
  on_linux do
    url "https://github.com/racgoo/task-pipeliner/releases/download/v0.2.6/tp-linux-x64"
    sha256 "68f32b957720b831617506dff500d94e0640378c04e9d7d5816171c4ba63de26"
  end
  
  def install
    bin.install Dir["tp-*"].first => "tp"
    bin.install_symlink "tp" => "task-pipeliner"
  end
  
  test do
    system "#{bin}/tp", "--version"
  end
end
