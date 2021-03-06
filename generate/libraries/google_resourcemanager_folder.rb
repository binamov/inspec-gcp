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
require 'gcp_backend'

# A provider to manage Resource Manager resources.
class ResourceManagerFolder < GcpResourceBase
  name 'google_resourcemanager_folder'
  desc 'Folder'
  supports platform: 'gcp'

  attr_reader :params
  attr_reader :name
  attr_reader :lifecycle_state
  attr_reader :create_time
  attr_reader :parent
  attr_reader :display_name

  def initialize(params)
    super(params.merge({ use_http_transport: true }))
    @params = params
    @fetched = @connection.fetch(product_url, resource_base_url, params, 'Get')
    parse unless @fetched.nil?
    @params = params
  end

  def parse
    @name = @fetched['name']
    @lifecycle_state = @fetched['lifecycleState']
    @create_time = parse_time_string(@fetched['createTime'])
    @parent = @fetched['parent']
    @display_name = @fetched['displayName']
  end

  # Handles parsing RFC3339 time string
  def parse_time_string(time_string)
    time_string ? Time.parse(time_string) : nil
  end

  def exists?
    !@fetched.nil?
  end

  def to_s
    "Folder #{@params[:name]}"
  end

  def un_parse
    {
      'name' => ->(x, _) { x.nil? ? [] : ["its('name') { should cmp #{x.inspect} }"] },
      'lifecycle_state' => ->(x, _) { x.nil? ? [] : ["its('lifecycle_state') { should cmp #{x.inspect} }"] },
      'create_time' => ->(x, _) { x.nil? ? [] : ["its('create_time.to_s') { should cmp '#{x.inspect}' }"] },
      'parent' => ->(x, _) { x.nil? ? [] : ["its('parent') { should cmp #{x.inspect} }"] },
      'display_name' => ->(x, _) { x.nil? ? [] : ["its('display_name') { should cmp #{x.inspect} }"] },
    }
  end

  def dump(path, template_path, test_number, ignored_fields)
    name = 'Folder'

    arr = un_parse.map do |k, v|
      next if ignored_fields.include?(k)
      v.call(method(k.to_sym).call, k)
    end
    template_vars = {
      name: name,
      arr: arr,
      type: 'google_resourcemanager_folder',
      identifiers: @params,
      number: test_number,
    }
    File.open("#{path}/#{name}_#{test_number}.rb", 'w') do |file|
      file.write(ERB.new(File.read(template_path)).result_with_hash(template_vars))
    end
  end

  private

  def product_url
    'https://cloudresourcemanager.googleapis.com/v2/'
  end

  def resource_base_url
    '{{name}}'
  end
end
