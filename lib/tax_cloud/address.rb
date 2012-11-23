module TaxCloud
  # An address
  class Address
    attr_accessor :address1, :address2, :city, :state, :zip5, :zip4

    # Initialize the object with the given variables
    def initialize(attrs = {})
      attrs.each do |sym, val|
        self.send "#{sym}=", val
      end
    end

    # Verify the address via TaxCloud
    def verify
      params = to_hash
      params = params.merge({ 
        'uspsUserID' => TaxCloud.configuration.usps_username 
      }) if TaxCloud.configuration.usps_username
      response = TaxCloud.client.request :verify_address, params
    end

    # Convert the object to a usable hash for SOAP requests
    def to_hash
      {
        'address1' => address1,
        'address2' => address2,
        'city' => city,
        'state' => state,
        'zip5' => zip5,
        'zip4' => zip4
      }
    end

  end
end
