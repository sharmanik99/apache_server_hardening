control "V-13613" do
  title "The Web site software used with the web server must have all
applicable security patches applied and documented."
  desc  "The IAVM process does not address all patches that have been
identified for the host operating system or, in this case, the web server
software environment. Many vendors have subscription services available to
notify users of known security threats. The site needs to be aware of these
fixes and make determinations based on local policy and what software features
are installed, if these patches need to be applied.

    In some cases, patches also apply to middleware and database systems.
Maintaining the security of web servers requires frequent reviews of security
notices. Many security notices mandate the installation of a software patch to
overcome security vulnerabilities.

    SAs and ISSOs should regularly check the vendor support web site for
patches and information related to the web server software. All applicable
security patches will be applied to the operating system and to the web server
software. Security patches are deemed applicable if the product is installed,
even if it is not used or is disabled.

  "
  impact 0.5
  tag "gtitle": "WA230"
  tag "gid": "V-13613"
  tag "rid": "SV-32969r2_rule"
  tag "stig_id": "WA230 A22"
  tag "fix_id": "F-29289r1_fix"
  tag "cci": []
  tag "nist": ["Rev_4"]
  tag "documentable": false
  tag "responsibility": "Information Assurance Officer"
  tag "check": "Query the web administrator to determine if the site has a
detailed process as part of its configuration management plan to stay compliant
with all security-related patches.

Proposed Questions:
How does the SA stay current with web server vendor patches?
How is the SA notified when a new security patch is issued by the vendor?
(Exclude the IAVM.)
What is the process followed for applying patches to the web server?

If the site is not in compliance with all applicable security patches, this is
a finding."
  tag "fix": "Establish a detailed process as part of the configuration
management plan to stay compliant with all web server security-related patches."

  describe "This test currently has no automated tests, you must check manually" do
    skip "This check must be preformed manually"
  end
end
