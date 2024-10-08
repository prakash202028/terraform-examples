enabled = true
vpc_id = "vpc-0e57346fde90d71cc"
agent_sets = {
  "dndc_connector" = {
    short_name                = ""
    bucket_path               = ""
    archive_file_name         = ""
    additional_iam_policy_arn = []
    ingress_ports             = ["443","1534"]
    egress_ports              = ["80"]
    security_group_ids = ["sg-12345678"]
  },
  "sdw_connector" = {
    short_name                = ""
    bucket_path               = ""
    archive_file_name         = ""
    additional_iam_policy_arn = []
    ingress_ports             = ["5432", "80"]
    egress_ports              = ["1534"]
    security_group_ids = []
  },
  "abcd_connector" = {
    short_name                = ""
    bucket_path               = ""
    archive_file_name         = ""
    additional_iam_policy_arn = []
    ingress_ports             = []
    egress_ports              = ["443"]
    security_group_ids = []
  }
}