require "rails/generators"

module OperationModel
  class ScaffoldGenerator < Rails::Generators::Base
    source_root File.expand_path("templates", __dir__)

    def create_operations_readme
      empty_directory "app/models/operations"
      empty_directory "app/models/operations/use_cases"

      template "README.md",  "app/models/operations/README.md"
      template "utility.rb", "app/models/operations/use_cases/utility.rb"
    end
  end
end
