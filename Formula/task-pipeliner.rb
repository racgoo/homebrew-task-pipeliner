class TaskPipeliner < Formula
  desc "A task pipeline runner with condition-based workflow execution"
  homepage "https://task-pipeliner.racgoo.com"
  license "MIT"
  version "0.2.18"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/racgoo/task-pipeliner/releases/download/v0.2.18/tp-macos-arm64"
      sha256 "1d44745cd34f0e4418ddaec5d25dfc04bbe361ed2685e8e2c3525358fc170209"
    else
      url "https://github.com/racgoo/task-pipeliner/releases/download/v0.2.18/tp-macos-x64"
      sha256 "999fa164428bec4d5bce8937bd46647371ec48f9cc077b838162957d63700951"
    end
  end
  
  on_linux do
    url "https://github.com/racgoo/task-pipeliner/releases/download/v0.2.18/tp-linux-x64"
    sha256 "d53e9646c7fc3bbfb216c36c7b13c9de1fe3da54e2e0d28aa2551d903439dd04"
  end
  
  def install
    bin.install Dir["tp-*"].first => "tp"
    bin.install_symlink "tp" => "task-pipeliner"
  end
  
  test do
    system "#{bin}/tp", "--version"
  end
end
