require 'rest-client'

class IpApiCache < ActiveRecord::Base
  def self.load_info_for_ips(arr_ips)
    return false unless arr_ips.is_a?(Array)
    query = {
        query: '',
        lang: 'en'
    }
    query = arr_ips.map do |e|
      item = query.dup
      item[:query] = e
      item
    end
    response = RestClient.post('http://ip-api.com/batch', query.to_json, { content_type: :json, accept: :json })
    if response.code == 200
      results = JSON.parse(response.body)
      results.each do |r|
        record = self.find_or_initialize_by(ip_address: r['query'])
        %w(city country country_code isp lat lon org region region_name timezone zip).each do |field|
          camelcase_field = field.split('_')
          camelcase_field.each_with_index { |e,i| camelcase_field[i] = e.titleize unless i == 0}
          camelcase_field = camelcase_field.join
          record.send("#{field}=", r[camelcase_field])
        end
        record.save!
      end
    end
  end
end
