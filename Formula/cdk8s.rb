require "language/node"

class Cdk8s < Formula
  desc "Define k8s native apps and abstractions using object-oriented programming"
  homepage "https://cdk8s.io/"
  url "https://registry.npmjs.org/cdk8s-cli/-/cdk8s-cli-2.0.1.tgz"
  sha256 "97b70c15e8a3c21ba522e0789e39fe5be3728e07d15916ba7a1ea9a7e205c7cf"
  license "Apache-2.0"

  bottle do
    sha256 cellar: :any_skip_relocation, all: "aed2134fdbdc21674b4a53afb03d36f65c34abe4e17ff081e78bfe43b0ba2b89"
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "Cannot initialize a project in a non-empty directory",
      shell_output("#{bin}/cdk8s init python-app 2>&1", 1)
  end
end
