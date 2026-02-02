class TaskPipeliner < Formula
  desc "A task pipeline runner with condition-based workflow execution"
  homepage "https://task-pipeliner.racgoo.com"
  license "MIT"
  version "0.2.9"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/racgoo/task-pipeliner/releases/download/v0.2.9/tp-macos-arm64"
      sha256 "13e2a2b3d01ad8ba5382883b4a3d5144bde9a366a12f4cc58495c609887d6ec8"
    else
      url "https://github.com/racgoo/task-pipeliner/releases/download/v0.2.9/tp-macos-x64"
      sha256 "00540cfa13b0546a6c0463c1476db9a0b25faf9695b6e5ff97838475470294c1"
    end
  end
  
  on_linux do
    url "https://github.com/racgoo/task-pipeliner/releases/download/v0.2.9/tp-linux-x64"
    sha256 "10ea17aff43c3e19bc83eb9bbcb054be4fb54ee35629a40b9c437cb899fe9d08"
  end
  
  def install
    bin.install Dir["tp-*"].first => "tp"
    bin.install_symlink "tp" => "task-pipeliner"
  end
  
  test do
    system "#{bin}/tp", "--version"
  end
end
