class TaskPipeliner < Formula
  desc "A task pipeline runner with condition-based workflow execution"
  homepage "https://task-pipeliner.racgoo.com"
  license "MIT"
  version ".0.3.2"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/racgoo/task-pipeliner/releases/download/v.0.3.2/tp-macos-arm64"
      sha256 "f9c3c86d0d8ff2c358615eba2d4c1048841d9fe87edaed6c032b2c57d3e244c5"
    else
      url "https://github.com/racgoo/task-pipeliner/releases/download/v.0.3.2/tp-macos-x64"
      sha256 "bfde2722c12a144c9ddf293bcd4560da7f32d9409efbec7e609e8c6e65ad8331"
    end
  end
  
  on_linux do
    url "https://github.com/racgoo/task-pipeliner/releases/download/v.0.3.2/tp-linux-x64"
    sha256 "967ccdd408a4d53be6e98bd1503a574f5669c4642234c4c9dec1d366276854cd"
  end
  
  def install
    bin.install Dir["tp-*"].first => "tp"
    bin.install_symlink "tp" => "task-pipeliner"
  end
  
  test do
    system "#{bin}/tp", "--version"
  end
end
