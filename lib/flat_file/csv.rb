require "csv"

module FlatFile
  module CSV

    # Read a CSV file and return its contents as an array of hashes.
    #
    # @param filepath [String] Path to the CSV file.
    # @return [Array<Hash>]
    def self.from_file(filepath)
      rows = []
      begin
        ::CSV.foreach(filepath, headers: true) do |row|
          rows.append(row)
        end
        return rows
      rescue StandardError => e
        # if defined?(Rails)
        #   Rails.logger.error({
        #     message: "Error reading CSV file",
        #     filepath: filepath,
        #     error: e,
        #   })
        # end
        return rows
      end
    end

    # Read a CSV stream and return its contents as an array of hashes.
    #
    # @param data [String, IO] Stream of CSV data.
    # @return [Array<Hash>]
    def self.from_stream(data)
      rows = []
      begin
        ::CSV.new(data, headers: true).each do |row|
          rows.append(row)
        end
        return rows
      rescue StandardError => e
        # if defined?(Rails)
        #   Rails.logger.error({
        #     message: "Error reading CSV data",
        #     error: e,
        #   })
        # end
        return rows
      end
    end

  end
end
