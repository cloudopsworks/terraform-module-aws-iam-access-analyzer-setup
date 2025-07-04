##
# (c) 2021-2025
#     Cloud Ops Works LLC - https://cloudops.works/
#     Find us on:
#       GitHub: https://github.com/cloudopsworks
#       WebSite: https://cloudops.works
#     Distributed Under Apache v2.0 License
#

# Variables for IAM Analyzer resources
# YAML format
#settings:
#   organization:
#     enabled: true | false        # (optional) Enable organization-wide IAM Analyzer
#     delegated: true | false      # (optional) Enable delegated administrator for IAM Analyzer
#     account_id: "123456789012"   # (optional) Account ID for delegated administrator
#  analyzer_enabled: true | false  # (optional) Enable IAM Analyzer only on account level, supersedded if organization.enabled is true or is_hub is true
#  analyzer_type: "ACCOUNT"      # (optional) Type of analyzer, default is ACCOUNT, possible values are ACCOUNT, ORGANIZATION, ACCOUNT_UNUSED_ACCESS, ORGANIZATION_UNUSED_ACCESS
#  archive_rules:                # (optional) Archive rules for IAM Analyzer
#    <rule_name>:
#      filters:          # Filters for the archive rule, at least one filter is required
#        - criteria: <criteria>  # Criteria for the filter
#          contains: [<value>,...]      # (optional) Contains value for the filter
#          eq: [<value>,...]            # (optional) Equal value for the filter
#          exists: true | false         # (optional) Existence check for the filter
#          neq: [<value>,...]            # (optional) Not equal value for the filter
variable "settings" {
  description = "Settings for the IAM analyzer resources"
  type        = any
  default     = {}
}