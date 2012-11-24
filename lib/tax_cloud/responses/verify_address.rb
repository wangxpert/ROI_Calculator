module TaxCloud
  module Responses

    # Response to a TaxCloud VerifyAddress.
    # https://api.taxcloud.net/1.0/TaxCloud.asmx?op=VerifyAddress
    class VerifyAddress < Base

      error_number "verify_address_response/verify_address_result/err_number"
      error_message "verify_address_response/verify_address_result/err_description"
      
      class << self
        # Parse a TaxCloud response.
        # @return [ TaxCloud::Address ] A verified address.
        def parse(savon_response)
          response = self.new(savon_response)
          result = response.match("verify_address_response/verify_address_result")
          result.delete(:err_number)
          TaxCloud::Address.new result
        end
      end

    end
  end
end