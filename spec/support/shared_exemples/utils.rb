# frozen_string_literal: true

RSpec.shared_examples 'Utils' do
  describe 'Methods' do
    private_methods = %I[generate_csv_header]

    private_methods.each do |method_name|
      it "is expected to define \"#{method_name}\" private method" do
        expect(test_instance.private_methods).to include(method_name)
      end
    end
  end
end
