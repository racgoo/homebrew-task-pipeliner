class TaskPipeliner < Formula
  desc "A task pipeline runner with condition-based workflow execution"
  homepage "https://task-pipeliner.racgoo.com"
  license "MIT"
  version "0.3.16"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/racgoo/task-pipeliner/releases/download/v0.3.16/tp-macos-arm64"
      sha256 "9d87f88cceab6abdcfd625b2965b049c8396f3889bc443abfba26fed434050c1"
    else
      url "https://github.com/racgoo/task-pipeliner/releases/download/v0.3.16/tp-macos-x64"
      sha256 "75fc006a95bf3cb204802e161905627f7e7567cf092c628aea75cfa65df4556a"
    end
  end
  
  on_linux do
    url "https://github.com/racgoo/task-pipeliner/releases/download/v0.3.16/tp-linux-x64"
    sha256 "9039cc82e385d69572af75204e5d0f3f4e945c0f533a2ee5f3f179299c0217e4"
  end
  
  def install
    bin.install Dir["tp-*"].first => "tp"
    bin.install_symlink "tp" => "task-pipeliner"
  end
  
  test do
    system "#{bin}/tp", "--version"
  end
end
