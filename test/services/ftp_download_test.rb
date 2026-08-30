require "minitest/autorun"
require_relative "../../app/services/ftp_download"

class FtpDownloadTest < Minitest::Test
  class FakeFtp
    class << self
      attr_accessor :host, :options, :instance
    end

    attr_reader :calls

    def self.new(host, options)
      self.host = host
      self.options = options
      self.instance = allocate
      instance.send(:initialize)
      instance
    end

    def initialize
      @calls = []
      @closed = false
    end

    def login(username, password)
      @calls << [:login, username, password]
    end

    def chdir(path)
      @calls << [:chdir, path]
    end

    def getbinaryfile(filename, localfile, blocksize)
      @calls << [:getbinaryfile, filename, localfile, blocksize]
      "firmware"
    end

    def closed?
      @closed
    end

    def close
      @closed = true
      @calls << [:close]
    end
  end

  def test_fetch_ignores_pasv_ip_and_closes_connection
    result = FtpDownload.new(
      host: "ftp.example.com",
      username: "user",
      password: "secret",
      ftp_class: FakeFtp
    ).fetch(path: "/releases", filename: "firmware.bin", blocksize: 1024)

    assert_equal "firmware", result
    assert_equal "ftp.example.com", FakeFtp.host
    assert_equal true, FakeFtp.options[:passive]
    assert_equal false, FakeFtp.options[:use_pasv_ip]
    assert_equal 10, FakeFtp.options[:open_timeout]
    assert_equal 15, FakeFtp.options[:read_timeout]
    assert_equal [
      [:login, "user", "secret"],
      [:chdir, "/releases"],
      [:getbinaryfile, "firmware.bin", nil, 1024],
      [:close]
    ], FakeFtp.instance.calls
  end
end
