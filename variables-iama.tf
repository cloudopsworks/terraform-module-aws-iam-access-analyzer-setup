##
# (c) 2021-2026
#     Cloud Ops Works LLC - https://cloudops.works/
#     Find us on:
#       GitHub: https://github.com/cloudopsworks
#       WebSite: https://cloudops.works
#     Distributed Under Apache v2.0 License
#

# Variables for IAM Access Analyzer resources
# YAML format
# settings:
#   organization:                     # (Optional) Organization-level settings. Default: {}.
#     enabled: false                  # (Optional) Create an ORGANIZATION analyzer; takes precedence over analyzer_type. Default: false.
#     delegated: false                # (Optional) Register account_id as delegated administrator for access-analyzer.amazonaws.com; deploy from the organization management account. Default: false.
#     account_id: "123456789012"      # (Optional) Member account ID to delegate; required when delegated is true.
#   analyzer_enabled: false           # (Optional) Create an analyzer; not needed when is_hub or organization.enabled is true. Default: false.
#   analyzer_type: "ACCOUNT"          # (Optional) Analyzer type; ignored when organization.enabled is true. Valid values: ACCOUNT, ACCOUNT_INTERNAL_ACCESS, ACCOUNT_UNUSED_ACCESS, ORGANIZATION, ORGANIZATION_INTERNAL_ACCESS, ORGANIZATION_UNUSED_ACCESS. Default: "ACCOUNT".
#   unused_access_age: 90             # (Optional) Days without use before access is reported as unused; set only with ACCOUNT_UNUSED_ACCESS or ORGANIZATION_UNUSED_ACCESS. Default: not set.
#   archive_rules:                    # (Optional) Archive rules keyed by rule name; requires an analyzer created by this deployment. Default: {}.
#     public_buckets:                 # (Optional) Example rule; the key becomes the rule name.
#       filters:                      # (Required) At least one filter; each filter needs criteria and one comparator.
#         - criteria: "resourceType"  # (Required) Finding attribute to match, such as resourceType, isPublic, or error.
#           contains: ["value"]       # (Optional) Contains comparator.
#           eq: ["AWS::S3::Bucket"]   # (Optional) Equals comparator.
#           exists: true              # (Optional) Exists comparator: true or false.
#           neq: ["value"]            # (Optional) Not-equals comparator.
variable "settings" {
  description = "(Optional) IAM Access Analyzer settings. With the default, no analyzer is created unless is_hub is true. Default: {}."
  type        = any
  default     = {}
}
