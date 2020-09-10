require "test_helper"

module Tests
  class FlatFileTest < Minitest::Test

    def test_CSV_from_file
      path = file_fixture("Campuses.csv")
      data = FlatFile::CSV.from_file(path)
      assert_equal(4, data.length)
    end

    def test_TSV_from_file
      path = file_fixture("Campuses.tsv")
      data = FlatFile::TSV.from_file(path)
      assert_equal(4, data.length)
    end

    # def test_QSV_from_file
    #   path = file_fixture("logs_requests.csv")
    #   data = FlatFile::QSV.from_file(path)
    #   assert_equal(2, data.length)
    #   assert_equal("Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:79.0) Gecko/20100101 Firefox/79.0", data.dig(0, "user_agent"))
    #   assert_equal("[FILTERED]", data.dig(0, "params", "password"))
    # end

    def test_JSON_from_file
      path = file_fixture("clay.json")
      data = FlatFile::JSON.from_file(path)
      assert_equal("Clay Dunston", data.dig("name"))
    end

  end
end
