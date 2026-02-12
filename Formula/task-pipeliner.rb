class TaskPipeliner < Formula
  desc "A task pipeline runner with condition-based workflow execution"
  homepage "https://task-pipeliner.racgoo.com"
  license "MIT"
  version "0.3.15"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/racgoo/task-pipeliner/releases/download/v0.3.15/tp-macos-arm64"
      sha256 "3d42616c56b94aa6f28ee78c830b91718299b77c1caf756b31aca1f8b6aadc10"
    else
      url "https://github.com/racgoo/task-pipeliner/releases/download/v0.3.15/tp-macos-x64"
      sha256 "d0fabbcf9d107bf337d903341570a4ca1901b35019d76372dab4f75c406d124c"
    end
  end
  
  on_linux do
    url "https://github.com/racgoo/task-pipeliner/releases/download/v0.3.15/tp-linux-x64"
    sha256 "0610593a39db17c16613ecfba1ed5a6abceee6d70b7ec1be3a132c3131c99b80"
  end
  
  def install
    bin.install Dir["tp-*"].first => "tp"
    bin.install_symlink "tp" => "task-pipeliner"
  end
  
  test do
    system "#{bin}/tp", "--version"
  end
end
