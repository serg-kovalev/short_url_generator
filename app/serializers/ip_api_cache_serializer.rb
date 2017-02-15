class IpApiCacheSerializer < ActiveModel::Serializer
  attributes :id, :ip_address, :city, :country, :country_code, :isp, :lat, :lon, :org, :region, :region_name,
             :timezone, :zip, :created_at, :updated_at
end