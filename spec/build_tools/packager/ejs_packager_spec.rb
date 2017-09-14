require 'spec_helper'
require File.join(PROJECT_ROOT, 'build_tools/compiler/asset_compiler.rb')
require File.join(PROJECT_ROOT, 'build_tools/packager/ejs_packager.rb')

describe Packager::EJSPackager do
  let(:generated_directory_path) {File.join(PROJECT_ROOT, "pkg/ejs_hackney_template-#{HackneyTemplate::VERSION}")}
  let(:generated_template_path) {File.join(generated_directory_path, "views/layouts/hackney_template.html")}
  let(:generated_package_json_path) {File.join(generated_directory_path, "package.json")}
  subject {described_class.new}

  after do
    FileUtils.rm_rf(generated_directory_path)
  end

  context "functional" do
    describe "build" do

      let(:example_package_json) {ERB.new(File.read(File.join(SPEC_ROOT, 'support/examples/package_ejs.json'))).result(binding)}
      it "should output the correct template" do
        subject.build

        generated_template = File.read(generated_template_path)
        expect(generated_template).to match(%r[href="<%= HackneyTemplateAssetPath %>stylesheets/hackney-template\.css\?#{Regexp.escape(HackneyTemplate::VERSION)}"])

        expect(File.read(generated_package_json_path)).to eql(example_package_json)
      end

    end
  end

end
