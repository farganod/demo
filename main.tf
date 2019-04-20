terraform{
	
	backend "s3"{
		region = "us-east-1"
		bucket = "fargtestunmanaged"
		key = "state/main.tf"
	}
}

provider "aws"{
	region = "us-east-1"
}

resource "aws_instance" "instance"{
	count = 3
	ami = "ami-02eba31f3459d3827"
	instance_type = "t2.micro"
	key_name = "DanLunchLearn"
	vpc_security_group_ids= ["sg-216daf6b"]
	subnet_id = "subnet-18ab7a36"
	tags{
		Name = "Dantest${count.index}"
	}
}
