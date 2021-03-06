# frozen_string_literal: false

# ----------------------------------------------------------------------------
#
#     ***     AUTO GENERATED CODE    ***    AUTO GENERATED CODE     ***
#
# ----------------------------------------------------------------------------
#
#     This file is automatically generated by Magic Modules and manual
#     changes will be clobbered when the file is regenerated.
#
#     Please read more about how to change this file in README.md and
#     CONTRIBUTING.md located at the root of this package.
#
# ----------------------------------------------------------------------------
require 'google/bigquery/property/table_external_data_configuration_bigtable_options_column_families_columns'
module GoogleInSpec
  module BigQuery
    module Property
      class TableExternalDataConfigurationBigtableOptionsColumnFamilies
        attr_reader :columns

        attr_reader :encoding

        attr_reader :family_id

        attr_reader :only_read_latest

        attr_reader :type

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @columns = GoogleInSpec::BigQuery::Property::TableExternalDataConfigurationBigtableOptionsColumnFamiliesColumnsArray.parse(args['columns'], to_s)
          @encoding = args['encoding']
          @family_id = args['familyId']
          @only_read_latest = args['onlyReadLatest']
          @type = args['type']
        end

        def to_s
          "#{@parent_identifier} TableExternalDataConfigurationBigtableOptionsColumnFamilies"
        end
      end

      class TableExternalDataConfigurationBigtableOptionsColumnFamiliesArray
        def self.parse(value, parent_identifier)
          return if value.nil?
          return TableExternalDataConfigurationBigtableOptionsColumnFamilies.new(value, parent_identifier) unless value.is_a?(::Array)
          value.map { |v| TableExternalDataConfigurationBigtableOptionsColumnFamilies.new(v, parent_identifier) }
        end
      end
    end
  end
end
