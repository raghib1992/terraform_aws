#creating group
resource "aws_iam_group" "admin_access" {
  name = "developer"
}
resource "aws_iam_policy_attachment" "group_policy" {
  name = "group_policy"
  groups = ["${aws_iam_group.admin_access.name}"]
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
