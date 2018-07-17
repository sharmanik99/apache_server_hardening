SYS_ADMIN = attribute(
  'sys_admin',
  description: "The system adminstrator",
  default: ['root']
)

APACHE_OWNER = attribute(
  'apache_owner',
  description: "The apache owner",
  default: 'apache'
)

control "V-2247" do
  title "Administrators must be the only users allowed access to the directory
tree, the shell, or other operating system functions and utilities."
  desc  "As a rule, accounts on a web server are to be kept to a minimum. Only
administrators, web managers, developers, auditors, and web authors require
accounts on the machine hosting the web server. This is in addition to the
anonymous web user account. The resources to which these accounts have access
must also be closely monitored and controlled. Only the SA needs access to all
the system’s capabilities, while the web administrator and associated staff
require access and control of the web content and web server configuration
files. The anonymous web user account must not have access to system resources
as that account could then control the server."
  impact 0.7
  tag "gtitle": "WG200"
  tag "gid": "V-2247"
  tag "rid": "SV-36456r2_rule"
  tag "stig_id": "WG200 A22"
  tag "fix_id": "F-26806r2_fix"
  tag "cci": []
  tag "nist": ["Rev_4"]
  tag "documentable": false
  tag "responsibility": "System Administrator"
  tag "check": "Obtain a list of the user accounts for the system, noting the
priviledges for each account.

Verify with the system administrator or the ISSO that all privileged accounts
are mission essential and documented.

Verify with the system administrator or the ISSO that all non-administrator
access to shell scripts and operating system functions are mission essential
and documented.

If undocumented privileged accounts are found, this is a finding.

If undocumented access to shell scripts or operating system functions is found,
this is a finding."
  tag "fix": "Ensure non-administrators are not allowed access to the directory
tree, the shell, or other operating system functions and utilities."

  begin

    authorized_sa_user_list = SYS_ADMIN.clone << APACHE_OWNER

    describe users.shells(/bash/).usernames do
      it { should be_in authorized_sa_user_list}
    end

    if users.shells(/bash/).usernames.empty?
      describe "Skip Message" do
        skip "Skipped: no users found with shell acccess."
      end
    end
  rescue Exception => msg
    describe "Exception: #{msg}" do
      it { should be_nil }
    end
  end
end
