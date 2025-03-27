## Personal collection of Terraform projects.

### See the main branch for other projects... [terraform-collection](https://github.com/mkonji008/terraform-collection)

#### This provisions a minimal Kubernetes (k8s) cluster on AWS EC2 using Terraform, and fits within the AWS free tier.

---

### Pre-run Checklist: Required Changes

1. **SSH Key Pair**:
   - Ensure you have an SSH key pair stored in AWS. If not, create one in the [AWS Management Console](https://console.aws.amazon.com/ec2/v2/home#KeyPairs).
   - Update the `key_name` variable with your SSH key name. This is the key Terraform will use to access the instances.
   
     Open the `terraform.tfvars` file and replace `"sshkeypairname"` with your actual key name:
     ```hcl
     key_name = "your-aws-key-name"  # Replace with your actual SSH key pair name
     ```

2. **Private Key Path**:
   - Make sure that your local private key is available for SSH access to the EC2 instances.
   - Update the `private_key` field in the `main.tf` file to point to your local private key path:
     ```hcl
     connection {
       type        = "ssh"
       host        = self.public_ip
       user        = "ec2-user"
       private_key = file("~/.ssh/id_rsa")  # double check path to private key
     }
     ```
   - Ensure that the private key file has the correct permissions and is accessible by Terraform. You can check permissions using the command:
     ```bash
     chmod 600 ~/.ssh/id_rsa
     ```

3. **Region**:
   - By default, the region is set to `us-west-2`. If you'd like to change the region, update the `region` variable in `terraform.tfvars`:
     ```hcl
     region = "us-west-2"  # check region for deployment
     ```
   - Alternatively, you can override the region in `terraform.tfvars` or set it as an environment variable.

4. **Instance Type**:
   - The default instance type is `t2.micro`, which falls within the AWS free tier. If you'd like to change the instance type (for example, to `t3.medium`), update the `instance_type` variable in `terraform.tfvars`:
     ```hcl
     instance_type = "t2.micro"  # default is free tier w/t2.micro but if not enough horse power bump it up... just be wary of costs.
     ```
   - This will configure the Kubernetes master and worker nodes with the specified instance type.

5. **AMI ID**:
   - The AMI ID for the EC2 instances is also customizable. If you want to use a specific AMI, you can change the `ami_id` variable in `terraform.tfvars`:
     ```hcl
     ami_id = "ami-0d8f6eb4f641d4849"  # default is amazon linux 2..  if you change this you'll need to modify the master/worker scripts to accommodate.
     ```

6. **Instance Tags**:
   - You can customize the tags applied to the EC2 instances. The default tags are defined in the `instance_tags` variable in `terraform.tfvars`:
     ```hcl
     instance_tags = {
       Name        = "k8s-inst-name"
       Environment = "dev"  # update accordingly
       Project     = "k8s-cluster-prj-name"
     }
     ```
   - Modify these values as needed to reflect your project and environment.

---

### Deployment

Run `terraform init` and then `terraform apply` to deploy the k8s cluster. Also reminder to self to `terraform destroy` when done. :)
