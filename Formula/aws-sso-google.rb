class AwsSsoGoogle < Formula
  desc "Acquire AWS STS credentials via Google Workspace SAML in a browser"
  homepage "https://github.com/walkersumida/aws-sso-google"
  version "0.7.1"

  head do
    url "https://github.com/walkersumida/aws-sso-google.git"
    depends_on "go" => :build
  end

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/walkersumida/aws-sso-google/releases/download/v0.7.1/aws-sso-google_0.7.1_darwin_amd64.tar.gz"
      sha256 "427db5e89f5ea865bf654b25aba88f05465b7aec9fa60ca18e231ca35c05f03a"
    end
    if Hardware::CPU.arm?
      url "https://github.com/walkersumida/aws-sso-google/releases/download/v0.7.1/aws-sso-google_0.7.1_darwin_arm64.tar.gz"
      sha256 "da7898fab382897c9936f478707fd58152df812d5ae924eaaae7a4536ba4f678"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/walkersumida/aws-sso-google/releases/download/v0.7.1/aws-sso-google_0.7.1_linux_amd64.tar.gz"
      sha256 "8dd0b35ad517c09ecbe40735d9fde8ea6b870eb7300746901d1c62c48b816586"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/walkersumida/aws-sso-google/releases/download/v0.7.1/aws-sso-google_0.7.1_linux_arm64.tar.gz"
      sha256 "5b1aec3da55d27f40523b85b21c54cfffac822ad467f9653ab3dadcd2ed77d98"
    end
  end

  def install
    system "make", "build" if build.head?
    bin.install "aws-sso-google"
  end
end
