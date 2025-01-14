# Generics
region  = "eu-central-1"
env     = "Team1"
project = "example"
# Take care that if you set create_prefix_for_resources variable in true all the resources names will change
/*create_prefix_for_resources = true*/

# Networks
vpc = [{ name = "vpc", cidr_block = "10.0.0.0/16", instance_tenancy = "default", enable_dns_hostnames = true, enable_dns_support = true }]
# Take care in configure the availability_zone in the same region
subnet_public    = [{ name = "subnet_public", cidr_block = "10.0.1.0/24", availability_zone = "eu-central-1a", map_public_ip_on_launch = true }]
subnet_private_1 = [{ name = "subnet_private_1", cidr_block = "10.0.2.0/24", availability_zone = "eu-central-1a", map_public_ip_on_launch = true }]
subnet_private_2 = [{ name = "subnet_private_2", cidr_block = "10.0.3.0/24", availability_zone = "eu-central-1b", map_public_ip_on_launch = false }]

# EC2
ec2name  = "Myinstance"
key_name = "MyEC2Key"
# Check that the amiid selected belongs to the region configured
amiid     = "ami-04376654933b081a7"
size      = "t2.micro"
root_disk = [{ volume_size = "8", volume_type = "gp2" }]
# To be run after creation
create_machine_script = "create_machine_script.tmpl"

# S3
bucket                    = [{ bucket = "bucket", acl = "private" }]
create_bucket_access_user = false
cors_rule                 = [{ allowed_methods = ["GET"], allowed_origins = ["my-origin"], max_age_seconds = 3000 }]

# RDS
rds-master         = [{ Name = "db-master", engine = "postgres", engine_version = "13.4", instance_class = "db.t3.micro", allocated_storage = 5, family = "postgres13" }]
db-name            = "db"
secret_password_id = "example/Team1/db-credentials"
create_replica     = false
subnet_group       = "subnet_group"

# Elastic IP
# We recommend using an elastic ip unless for production
create_elastic_ip = true

# ECR
ecr_repositories = []
# In the ECR variable you can configure a list of repositories
# For each repository you need to specify the "name" and the maximum number of images "max_image" that you want to keep
# ecr_repositories = [{"name" = "repository_1", "max_images" = 5}]
create_ecr_access_user = false

# Cloudwatch
use_cloudwatch_for_logging    = false
use_cloudwatch_for_monitoring = false
notification_email_list       = []
