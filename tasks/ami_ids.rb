namespace :ami do
  require 'amino'
  require 'erb'

  desc "Create ami mapping by query"
  task :map, 'query'
  task :map do |t, args|
    amis = {}
    template = File.read('./tasks/ami_template.erb')

    list_regions.map do |region|
      amis[region] = {
        "AMI" => retrieve_id_by_amino(region, args['query'])
      }
    end
    $stderr.puts "============="
    puts ERB.new(template, nil, '-').result(binding)
  end

  def list_regions
     regions = ::Aws::EC2::Client.new(region: "us-east-1").describe_regions.regions
     regions.map {|region| region.region_name}
  end

  def retrieve_id_by_amino(region, query)
    ami = Amino({'name' => query, 'product-code.type' => "marketplace"}, {region: region}).first
    $stderr.puts [region, ami.name, ami.creation_date].join(": ")
    ami.image_id
  end
end
