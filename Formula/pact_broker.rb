class PactBroker < Formula
  desc "The Pact Broker is an application for sharing of consumer driven contracts and verification results."
  homepage "https://github.com/pact-foundation/pact_broker"
  version "2.107.1"

  on_macos do
    on_arm do
      url "https://github.com/YOU54F/traveling-ruby/releases/download/rel-20230803-pact/traveling-pact-20230803-3.2.2-osx-arm64-full.tar.gz"
      sha256 "a58cdaaccbd0dc869df9708e91c89099a707e16d42f41360f310838ffcbd682a"
    end
    on_intel do
      url "https://github.com/YOU54F/traveling-ruby/releases/download/rel-20230803-pact/traveling-pact-20230803-3.2.2-osx-x86_64-full.tar.gz"
      sha256 "fa4f621f78fa969dab327ccbda7fae093bdd1a96e7cedb9aa191b0fb474919e8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/YOU54F/traveling-ruby/releases/download/rel-20230803-pact/traveling-pact-20230803-3.2.2-linux-arm64-full.tar.gz"
      sha256 "6069662f2710dde425cbd03269c2e1b51c0d57922dc46e1eb2727027ade9b646"
    end
    on_intel do
      url "https://github.com/YOU54F/traveling-ruby/releases/download/rel-20230803-pact/traveling-pact-20230803-3.2.2-linux-x86_64-full.tar.gz"
      sha256 "985ea04d60c584342ff6a1ae879adfd0a367143b64d42d304db732cd597f8a83"
    end
  end

  def install
    libexec.install Dir["*"]
    %w[pact-broker-app.sh].each do |cmd|
      bin.install_symlink "#{libexec}/#{cmd}" => "#{cmd.gsub(".sh", "")}"
    end
  end

  # test do
  #   system "#{bin}/pact_verifier_cli", "--help"
  # end
end