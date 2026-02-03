class TaskPipeliner < Formula
  desc "A task pipeline runner with condition-based workflow execution"
  homepage "https://task-pipeliner.racgoo.com"
  license "MIT"
  version "0.2.14"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/racgoo/task-pipeliner/releases/download/v0.2.14/tp-macos-arm64"
      sha256 "e671564d2d38211f11c761cdc192f5772d47a22a4ca3cc6bb233977c387fbcc5"
    else
      url "https://github.com/racgoo/task-pipeliner/releases/download/v0.2.14/tp-macos-x64"
      sha256 "eaef9e22289fc8d87d55402acb8321020cceed583e9f1d8b81702a3e82e67aa6"
    end
  end
  
  on_linux do
    url "https://github.com/racgoo/task-pipeliner/releases/download/v0.2.14/tp-linux-x64"
    sha256 "2bc68e81e685fb99d36c79723f20da9284724990a6cbabde8c739c6643013e60"
  end
  
  def install
    bin.install Dir["tp-*"].first => "tp"
    bin.install_symlink "tp" => "task-pipeliner"
  end
  
  test do
    system "#{bin}/tp", "--version"
  end
end
