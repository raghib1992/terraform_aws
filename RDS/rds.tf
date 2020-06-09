resource "aws_db_subnet_group" "db_subnet" {
    name = "db_subnet"
    description = "db subnet"
    subnet_ids = ["${aws_subnet.private_main_1.id}","${aws_subnet.private_main_2.id}","${aws_subnet.private_main_3.id}"]
}

resource "aws_db_parameter_group" "db_parameter" {
  name = "db-parameter"
  family = "MariaDB10.3"
  parameter {
      name = "max_allowed_packet"
      value = "16777216"
  }
}


resource "aws_db_instance" "mariadb" {
  allocated_storage = 100
  engine = "mariadb"
  engine_version = "10.1.13"
  instance_class = "db.t2.micro"
  identifier = "mariadb"
  name = "mariaDB"
  username = "root"
  password = "mariaDB"
  db_subnet_group_name = "db_subnet"
  parameter_group_name = "db-parameter"
  multi_az = "false"
  vpc_security_group_ids = ["${aws_security_group.db.id}"]
  storage_type = "gp2"
  backup_retention_period = 30
  availability_zone = aws_subnet.private_main_2.availability_zone
  tags = {
      Name = "mariaDB"
  }
}
