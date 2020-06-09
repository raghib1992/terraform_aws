# Create User
resource "aws_iam_user" "admin1" {
  name = "ilma"
}
resource "aws_iam_user" "admin2" {
  name = "afsa"
}
resource "aws_iam_group_membership" "attachment" {
  name = "attachment"
  users = [
      "${aws_iam_user.admin1.name}",
      "${aws_iam_user.admin2.name}",
  ]
  group = aws_iam_group.admin_access.name
}
