class TaskPipeliner < Formula
  desc "A task pipeline runner with condition-based workflow execution"
  homepage "https://task-pipeliner.racgoo.com"
  license "MIT"
  version "0.3.1"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/racgoo/task-pipeliner/releases/download/v0.3.1/tp-macos-arm64"
      sha256 "fad4691fa9136098b0cc9b0e20941e6f5c88e863e8e0bfcaa47d517ab6e7e29e"
    else
      url "https://github.com/racgoo/task-pipeliner/releases/download/v0.3.1/tp-macos-x64"
      sha256 "16315eb89ce0585ef1129e10f66ad6997479c69cbcd470cf79d8b044850baab6"
    end
  end
  
  on_linux do
    url "https://github.com/racgoo/task-pipeliner/releases/download/v0.3.1/tp-linux-x64"
    sha256 "d4913a083711604c11c6b283ab46105a84d7eea9542fd52c8798cc9079ba0a64"
  end
  
  def install
    bin.install Dir["tp-*"].first => "tp"
    bin.install_symlink "tp" => "task-pipeliner"
  end
  
  test do
    system "#{bin}/tp", "--version"
  end
end
