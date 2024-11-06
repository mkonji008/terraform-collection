## Personal collection of Terraform projects.

### See the main branch for other projects... [terraform-collection](https://github.com/mkonji008/terraform-collection)

#### This provisions a minimal k8s cluster on aws/ec2 using terraform and fits within the aws   free tier.


### Pre-run Checklist: Required Changes

1. **SSH Key Pair**:
   - Have an SSH key pair stored in aws.
   - Update `variables.tf` with the name of the key pair:
     ```hcl
     variable "key_name" {
       description = "Name of the SSH key pair"
       default     = "your-aws-key-name"  # Replace with your key pair name
     }
     ```

2. **Private Key Path**:
   - Update the `private_key` field in `main.tf` to point @ the local private key file for ssh:
     ```hcl
     connection {
       type        = "ssh"
       host        = self.public_ip
       user        = "ec2-user"
       private_key = file("~/.ssh/id_rsa")  # Replace with your private key path
     }
     ```
   - Make sure the private key file has the right permissions and is accessible by tf.

3. **Region (Optional)**:
   - If you want to change the AWS region, update the `region` variable in `variables.tf`:
     ```hcl
     variable "region" {
       description = "AWS region"
       default     = "us-west-2"  # Replace with whatever region needed
     }
     ```

4. **Instance Type (Optional)**:
   - It's set to  `t2.micro` as it's within the free tier. Update the instance type in `variables.tf` if necessary:
     ```hcl
     variable "instance_type" {
       description = "Instance type for Kubernetes nodes"
       default     = "t2.micro"  # Adjust if needed
     }
     ```

Run `terraform init` and then `terraform apply` to deploy the k8s cluster.

### Cleanup.....
A personal note to never be reminded about unwanted charges the hard way, destroy resources with `terraform destroy` when done.....

