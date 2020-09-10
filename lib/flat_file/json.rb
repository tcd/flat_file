require "json"

module FlatFile
  module JSON

    # Return a hash parsed from a given JSON file.
    #
    # @param file [String]
    # @return [Hash,ActiveSupport::HashWithIndifferentAccess]
    def self.from_file(file)
      data = ::JSON.parse(File.read(file))
      if defined?(ActiveSupport::HashWithIndifferentAccess)
        return data&.with_indifferent_access || data
      end
      return data
    end

  end
end
