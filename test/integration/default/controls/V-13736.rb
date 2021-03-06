APACHE_CONF_FILE = attribute(
  'apache_conf_file',
  description: 'define path for the apache configuration file',
  default: "/etc/httpd/conf/httpd.conf"
)

control "V-13736" do
  title "The HTTP request message body size must be limited."
  desc  "Buffer overflow attacks are carried out by a malicious attacker
sending amounts of data that the web server cannot store in a given size
buffer. The eventual overflow of this buffer can overwrite system memory.
Subsequently an attacker may be able to elevate privileges and take control of
the server. The Apache directives listed below limit the size of the various
HTTP header sizes thereby limiting the chances for a buffer overflow.

    The LimitRequestBody directive allows the user to set a limit on the
allowed size of an HTTP request message body within the context in which the
directive is given (server, per-directory, per-file or per-location). If the
client request exceeds that limit, the server will return an error response
instead of servicing the request. The size of a normal request message body
will vary greatly depending on the nature of the resource and the methods
allowed on that resource. CGI scripts typically use the message body for
retrieving form information. Implementations of the PUT method will require a
value at least as large as any representation that the server wishes to accept
for that resource.

  "
  impact 0.5
  tag "gtitle": "WA000-WWA060"
  tag "gid": "V-13736"
  tag "rid": "SV-32756r1_rule"
  tag "stig_id": "WA000-WWA060 A22"
  tag "fix_id": "F-29249r1_fix"
  tag "cci": []
  tag "nist": ["Rev_4"]
  tag "documentable": false
  tag "responsibility": "Web Administrator"
  tag "check": "To view the LimitRequestBody value enter the following command:

grep \"LimitRequestBody\" /usr/local/apache2/conf/httpd.conf.

If the value of LimitRequestBody is not set to 1 or greater or does not exist,
this is a finding.

Note: The default value is set to unlimited. It is recommended that the
directive be explicitly set to prevent unexpected results should the defaults
change with updated software."
  tag "fix": "Edit the httpd.conf file and specify a size for the
LimitRequestBody directive. "

  describe apache_conf(APACHE_CONF_FILE) do
    its('LimitRequestBody') { should cmp >= 1 }
  end
end
