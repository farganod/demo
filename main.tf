terraform{
	required_version = "=0.11.13"
	
	backend "s3"{
		region = "us-east-1"
		bucket = "fargtest123"
		key = "state/main.tf"
	}
}

provider "aws"{
	access_key = "AKIAZMYAZZY66CF7SK7B"
  	secret_key = "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"
	version = "~> 1.56"
	region = "us-east-1"
}

resource "aws_instance" "instance"{
	count = 3
	ami = "ami-0a313d6098716f372"
	instance_type = "t2.micro"
	key_name = "dantest"
	vpc_security_group_ids= ["sg-0086950141f3f4413"]
	subnet_id = "subnet-0614d5ed72289cd75"
	tags{
		Name = "Dantest${count.index}"
	}
}
