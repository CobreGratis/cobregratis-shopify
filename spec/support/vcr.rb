require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  c.hook_into :webmock
  c.filter_sensitive_data('COBREGRATIS_TOKEN') do |interaction|
    ENV['COBREGRATIS_TOKEN']
  end
end