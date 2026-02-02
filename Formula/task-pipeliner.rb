class TaskPipeliner < Formula
  desc "A task pipeline runner with condition-based workflow execution"
  homepage "https://task-pipeliner.racgoo.com"
  license "MIT"
  version "0.2.11"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/racgoo/task-pipeliner/releases/download/v0.2.11/tp-macos-arm64"
      sha256 "3df6a6beb1c6804cf62710d1964e004df7fd3fa1ebd68e041847e92006b7eddf"
    else
      url "https://github.com/racgoo/task-pipeliner/releases/download/v0.2.11/tp-macos-x64"
      sha256 "df632c5b37d50c56f1aba9894300e62af2526127a087014fa5704502a5438822"
    end
  end
  
  on_linux do
    url "https://github.com/racgoo/task-pipeliner/releases/download/v0.2.11/tp-linux-x64"
    sha256 "7b3eac045660b4f2675f575a8fa0ef119b8ecc6fac038f6ab2d6a8747e0b731e"
  end
  
  def install
    bin.install Dir["tp-*"].first => "tp"
    bin.install_symlink "tp" => "task-pipeliner"
  end
  
  test do
    system "#{bin}/tp", "--version"
  end
end
