require "rails/generators"

module OperationModel
  class ScaffoldGenerator < Rails::Generators::Base
    source_root File.expand_path("templates", __dir__)

    def create_operations_readme
      empty_directory "app/models/operations"
      empty_directory "app/models/operations/use_cases"

      operation_paths = [
        { template_name: "README.md",  file_path: "app/models/operations/README.md" },
        { template_name: "utility.rb", file_path: "app/models/operations/use_cases/utility.rb" },
      ]

      operation_paths.each do |operation_path|
        File.exist?(operation_path[:file_path]) ? say_status("skip", operation_path[:file_path], :yellow) : template(operation_path[:template_name], operation_path[:file_path])
      end
    end

    def create_model_operations
      skip_model_names = ['application_record', 'utility']
      model_files      = Dir.glob("app/models/*.rb")

      model_files.each do |model_file|
        @model_name   = File.basename(model_file, ".rb")

        template_name = "operation_model.rb.tt"
        file_path     = "app/models/operations/#{@model_name}.rb"

        (File.exist?(file_path) || skip_model_names.include?(@model_name)) ? say_status("skip", file_path, :yellow) : template(template_name, file_path)
      end
    end
  end
end
