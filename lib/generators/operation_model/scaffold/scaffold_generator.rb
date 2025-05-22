require "rails/generators"

module OperationModel
  module Scaffold
    class ScaffoldGenerator < Rails::Generators::Base
      source_root File.expand_path("templates", __dir__)

      def create_operations_readme
        empty_directory "app/models/operations"
        template "README.md.tt", "app/models/operations/README.md"
      end
    end
  end
end
