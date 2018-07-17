APACHE_CONF_FILE = attribute(
  'apache_conf_file',
  description: 'define path for the apache configuration file',
  default: "/etc/httpd/conf/httpd.conf"
)

control "V-13738" do
  title "The HTTP request header field size must be limited."
  desc  "Buffer overflow attacks are carried out by a malicious attacker
sending amounts of data that the web server cannot store in a given size
buffer. The eventual overflow of this buffer can overwrite system memory.
Subsequently an attacker may be able to elevate privileges and take control of
the server. This Apache directives limits the size of the various HTTP header
sizes thereby limiting the chances for a buffer overflow.

    The LimitRequestFieldSize directive allows the server administrator to
reduce or increase the limit on the allowed size of an HTTP request header
field. A server needs this value to be large enough to hold any one header
field from a normal client request. The size of a normal request header field
will vary greatly among different client implementations, often depending upon
the extent to which a user has configured their browser to support detailed
content negotiation. SPNEGO authentication headers can be up to 12392 bytes.

    This directive gives the server administrator greater control over abnormal
client request behavior, which may be useful for avoiding some forms of
denial-of-service attacks.

  "
  impact 0.5
  tag "gtitle": "WA000-WWA064"
  tag "gid": "V-13738"
  tag "rid": "SV-32766r2_rule"
  tag "stig_id": "WA000-WWA064 A22"
  tag "fix_id": "F-29256r4_fix"
  tag "cci": []
  tag "nist": ["Rev_4"]
  tag "documentable": false
  tag "responsibility": "Web Administrator"
  tag "check": "To view the LimitRequestFieldSize value enter the following
command:

grep \"LimitRequestFieldSize\" /usr/local/apache2/conf/httpd.conf.

If no LimitRequestFieldSize directives exist, this is a Finding. Although the
default value is 8190, this directive must be explicitly set.

If the value of LimitRequestFieldSize is not set to 8190, this is a finding.
"
  tag "fix": "Edit the httpd.conf file and ensure the LimitRequestFieldSize is
explicitly configured and set to 8190 or other approved value. "


  describe apache_conf(APACHE_CONF_FILE) do
    its('LimitRequestFieldSize') { should cmp 8190 }
  end
end
