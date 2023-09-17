# typed: false
# frozen_string_literal: true

class Tart < Formula
  desc "Run macOS VMs on Arm64 & and Linux VMs on Arm64/Intel"
  homepage "https://github.com/you54f/tart"
  version "1.12.1"
  license "Fair Source"

  depends_on "go" => :build
  depends_on "go-md2man" => :build
  depends_on "gpgme"

  depends_on "you54f/brew/softnet"
  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cirruslabs/tart/archive/refs/heads/main.zip"
      sha256 "3e0852f9831ff90108a329e0bb7e375290e3b8db2ab8d3e72df494d4cdb62d1f"

      def install
        system "swift build --product tart --configuration release --disable-sandbox"
        system "codesign --sign - --entitlements Resources/tart-prod.entitlements --force .build/release/tart"
        bin.install ".build/release/tart" => "tart"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/darren/tart/archive/refs/heads/x86.zip"
      sha256 "6ea7ac7d2d06bd79ea49b8b3f77f25b140038980ebf0115ec7bfcbc91e47e3b9"
      def install
        system "swift build --product tart --configuration release --disable-sandbox"
        system "codesign --sign - --entitlements Resources/tart-dev.entitlements --force .build/release/tart"
        lib.install "Resources/tart-dev.entitlements" => "tart-dev.entitlements"
        lib.install "Resources/tart-prod.entitlements" => "tart-prod.entitlements"
        bin.install ".build/release/tart" => "tart"
      end
    end
  end

  def caveats
    <<~EOS
      See the GitHub repository for more information
      app getting killed straight away? check your entitlements
      codesign --sign - --entitlements #{lib}/tart-dev.entitlements --force tart
      codesign --sign - --entitlements #{lib}/tart-prod.entitlements --force tart
    EOS
  end
  def post_install
    <<~EOS
      ## Creating from scratch

      Tart supports macOS and Linux virtual machines. All commands like `run` and `pull` work the same way regarding of the underlying OS a particular VM image has.
      The only difference is how such VM images are created. Please check sections below for [macOS](#creating-a-macos-vm-image-from-scratch) and [Linux](#creating-a-linux-vm-image-from-scratch) instructions.
      
      ### Creating a macOS VM image from scratch
      
      Tart can create VMs from `*.ipsw` files. You can download a specific `*.ipsw` file [here](https://ipsw.me/) or you can
      use `latest` instead of a path to `*.ipsw` to download the latest available version:
      
      ```bash
      tart create --from-ipsw=latest ventura-vanilla
      tart run ventura-vanilla
      ```
      
      After the initial booting of the VM you'll need to manually go through the macOS installation process. As a convention we recommend creating an `admin` user with an `admin` password. After the regular installation please do some additional modifications in the VM:
      
      1. Enable Auto-Login. Users & Groups -> Login Options -> Automatic login -> admin.
      2. Allow SSH. Sharing -> Remote Login
      3. Disable Lock Screen. Preferences -> Lock Screen -> disable "Require Password" after 5.
      4. Disable Screen Saver.
      5. Run `sudo visudo` in Terminal, find `%admin ALL=(ALL) ALL` add `admin ALL=(ALL) NOPASSWD: ALL` to allow sudo without a password.
      
      ### Creating a Linux VM image from scratch
      
      Linux VMs are supported on hosts running macOS 13.0 (Ventura) or newer.
      
      ```bash
      # Create a bare VM
      tart create --linux ubuntu
      
      # Install Ubuntu
      tart run --disk focal-desktop-arm64.iso ubuntu
      
      # Run VM
      tart run ubuntu
      ```
      
      After the initial setup please make sure your VM can be SSH-ed into by running the following commands inside your VM:
      
      ```bash
      sudo apt update
      sudo apt install -y openssh-server
      sudo ufw allow ssh
      ```
      
      ## Configuring a VM
      
      By default, a tart VM uses 2 CPUs and 4 GB of memory with a `1024x768` display. This can be changed with `tart set` command.
      Please refer to `tart set --help` for additional details.
      
    EOS
  end
end
