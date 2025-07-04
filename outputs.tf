##
# (c) 2021-2025
#     Cloud Ops Works LLC - https://cloudops.works/
#     Find us on:
#       GitHub: https://github.com/cloudopsworks
#       WebSite: https://cloudops.works
#     Distributed Under Apache v2.0 License
#

output "access_analyzer_id" {
  value = length(aws_accessanalyzer_analyzer.this) > 0 ? aws_accessanalyzer_analyzer.this[0].id : null
}

output "access_analyzer_name" {
  value = length(aws_accessanalyzer_analyzer.this) > 0 ? aws_accessanalyzer_analyzer.this[0].analyzer_name : null
}