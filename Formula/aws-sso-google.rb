class AwsSsoGoogle < Formula
  desc "Acquire AWS STS credentials via Google Workspace SAML in a browser"
  homepage "https://github.com/walkersumida/aws-sso-google"
  version "0.7.0"

  head do
    url "https://github.com/walkersumida/aws-sso-google.git"
    depends_on "go" => :build
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/walkersumida/aws-sso-google/releases/download/v0.7.0/aws-sso-google_0.7.0_darwin_arm64.tar.gz"
      sha256 "3f19eba4e7dcef4d69be08646f707551b121cbab2cbba1e97c0ebc0eabf0d01b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/walkersumida/aws-sso-google/releases/download/v0.7.0/aws-sso-google_0.7.0_darwin_amd64.tar.gz"
      sha256 "3a00714b54fdcd298e819a83b82d8e96fd73a590e6e4c6c1ac699793243547b7"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/walkersumida/aws-sso-google/releases/download/v0.7.0/aws-sso-google_0.7.0_linux_arm64.tar.gz"
      sha256 "332e491572273103d9be194191b08b6805bdbf3cb6eda1691620cf48a92a00ed"
    end
    if Hardware::CPU.intel?
      url "https://github.com/walkersumida/aws-sso-google/releases/download/v0.7.0/aws-sso-google_0.7.0_linux_amd64.tar.gz"
      sha256 "c5c9ff8b8fba9c8d10777d6b54dce422064681c6f2c440bac77bf2449130398a"
    end
  end

  def install
    system "make", "build" if build.head?
    bin.install "aws-sso-google"
  end
end
