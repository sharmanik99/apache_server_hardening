APACHE_AUTHORIZED_MODULES= attribute(
  'apache_authorized_modules',
  description: 'List of  authorized apache modules.',
  default: [
            "core_module",
            "http_module",
            "so_module",
            "mpm_prefork_module"
           ]
)
APACHE_UNAUTHORIZED_MODULES= attribute(
  'apache_unauthorized_modules',
  description: 'List of  unauthorized apache modules.',
  default: [
            "info_module",
            "status_module"
           ]
)

control "V-26294" do
  title "Web server status module must be disabled."
  desc  "The Apache mod_info module provides information on the server
configuration via access to a /server-info URL location, while the mod_status
module provides current server performance statistics. While having server
configuration and status information available as a web page may be convenient,
it is recommended that these modules not be enabled: Once mod_info is loaded
into the server, its handler capability is available in per-directory .htaccess
files and can leak sensitive information from the configuration directives of
other Apache modules such as system paths, usernames/passwords, database names,
etc. If mod_status is loaded into the server, its handler capability is
available in all configuration files, including per-directory files (e.g.,
.htaccess) and may have security-related ramifications."
  impact 0.5
  tag "gtitle": "WA00510"
  tag "gid": "V-26294"
  tag "rid": "SV-33218r1_rule"
  tag "stig_id": "WA00510 A22"
  tag "fix_id": "F-29395r1_fix"
  tag "cci": []
  tag "nist": ["Rev_4"]
  tag "documentable": false
  tag "responsibility": "Web Administrator"
  tag "check": "Enter the following command:

/usr/local/Apache2.2/bin/httpd –M.

This will provide a list of all loaded modules.  If any of the following
modules are found, this is a finding.

info_module
status_module"
  tag "fix": "Edit the httpd.conf file and disable info_module and
status_module."

  apache_loaded_modules = command("httpd -M").stdout.split

  describe APACHE_UNAUTHORIZED_MODULES do
    it { should_not be_in apache_loaded_modules }
  end
end
