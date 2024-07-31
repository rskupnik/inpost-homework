resource "aws_s3_bucket" "bucket" {
  bucket = "my-tf-test-bucket"
}

# This is a bare-bones example due to time constraints
# With scalability, availability and security in mind, these are the options I would consider:
# - simplest one would be to add an Autoscaling Group + Load Balancer for traffic
# - a more robust one would be to host the application in a k8s cluster
resource "aws_instance" "web" {
  ami           = "ami-0c55b159cbfafe1f0" # This is an example AMI ID; it won't be used in LocalStack
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleApp"
  }
}

# Note: this will not work on LocalStack without a PRO plan
# Comment it out for testing on basic plan
resource "aws_db_instance" "db" {
  allocated_storage    = 10
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  username             = "test"
  password             = "testpass"
  parameter_group_name = "default.mysql5.7"
}

resource "aws_s3_object" "object" {
  bucket = aws_s3_bucket.bucket.bucket
  key    = "example"
  source = "examplefile.json"
  etag   = filemd5("examplefile.json")
}
