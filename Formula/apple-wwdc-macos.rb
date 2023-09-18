# typed: false
# frozen_string_literal: true

class AppleWwdcMacos < Formula
  desc "Running macOS in a virtual machine on Apple silicon"
  homepage "https://developer.apple.com/documentation/virtualization/running_macos_in_a_virtual_machine_on_apple_silicon"
  version "14.0"
  depends_on :macos

  on_macos do
    url "https://docs-assets.developer.apple.com/published/de5a65571c/RunningMacOSInAVirtualMachineOnAppleSilicon.zip"
    sha256 "6868bbcb551257c3dc02ed35eace0a3c0a19e549ae90f8bcf9158daae4f838f7"

      def install
        system "xcodebuild -project macOSVirtualMachineSampleApp.xcodeproj -target InstallationTool-Objective-C \
        DEVELOPMENT_TEAM=9QTPQPMSHY \
        CODE_SIGN_ENTITLEMENTS=InstallationTool.entitlements \
        CODE_SIGN_STYLE='Automatic' \
        PROVISIONING_PROFILE_SPECIFIER='' \
        CODE_SIGN_IDENTITY='Mac Development'"
        # system "codesign --sign - --entitlements Resources/tart-prod.entitlements --force .build/release/tart"
        bin.install ".build/release/macOSVirtualMachineSampleApp-Objective-C.app" => "macOSVirtualMachineSampleApp"
    end
  end

  def caveats
    <<~EOS
      See the Apple webiste for more information
    EOS
  end
end
