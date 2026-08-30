require "net/ftp"

class FtpDownload
  OPEN_TIMEOUT = 10
  READ_TIMEOUT = 15

  def initialize(host:, username:, password:, ftp_class: Net::FTP)
    @host = host
    @username = username
    @password = password
    @ftp_class = ftp_class
  end

  def fetch(path:, filename:, blocksize:)
    ftp = @ftp_class.new(
      @host,
      passive: true,
      # Some FTP servers behind NAT advertise an unreachable private address
      # in PASV. Reuse the public control-connection host with the PASV port.
      use_pasv_ip: false,
      open_timeout: OPEN_TIMEOUT,
      read_timeout: READ_TIMEOUT
    )
    ftp.login(@username, @password)
    ftp.chdir(path)
    ftp.getbinaryfile(filename, nil, blocksize)
  ensure
    ftp.close if ftp && !ftp.closed?
  end
end
