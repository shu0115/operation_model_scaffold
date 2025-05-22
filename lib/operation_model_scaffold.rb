# frozen_string_literal: true

require_relative "operation_model_scaffold/version"

module OperationModelScaffold
  class Error < StandardError; end
end

require_relative "generators/operation_model/scaffold_generator"
