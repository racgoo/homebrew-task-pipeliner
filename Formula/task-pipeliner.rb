class TaskPipeliner < Formula
  desc "A task pipeline runner with condition-based workflow execution"
  homepage "https://task-pipeliner.racgoo.com"
  license "MIT"
  version "0.2.4"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/racgoo/task-pipeliner/releases/download/v0.2.4/tp-macos-arm64"
      sha256 "8184fc17078cb1734bde2897d95068214a26bb0ec0a5243e141b4d719c98b9ba"
    else
      url "https://github.com/racgoo/task-pipeliner/releases/download/v0.2.4/tp-macos-x64"
      sha256 "53dde178016bdee5b979556c160065fb413c127645289f17a4cfc4d2d2fbc83d"
    end
  end
  
  on_linux do
    url "https://github.com/racgoo/task-pipeliner/releases/download/v0.2.4/tp-linux-x64"
    sha256 "815ac59a9e8b6391eb9b9bda2e36d1aa19395303b7aa82850b3793e34bd33055"
  end
  
  def install
    bin.install Dir["tp-*"].first => "tp"
    bin.install_symlink "tp" => "task-pipeliner"
  end
  
  test do
    system "#{bin}/tp", "--version"
  end
end
