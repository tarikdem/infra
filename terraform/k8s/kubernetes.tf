locals {
  cluster_name                 = "k8s.infra.tova.sh"
  master_autoscaling_group_ids = [aws_autoscaling_group.master-eu-west-1a-masters-k8s-infra-tova-sh.id]
  master_security_group_ids    = [aws_security_group.masters-k8s-infra-tova-sh.id]
  masters_role_arn             = aws_iam_role.masters-k8s-infra-tova-sh.arn
  masters_role_name            = aws_iam_role.masters-k8s-infra-tova-sh.name
  node_autoscaling_group_ids   = [aws_autoscaling_group.nodes-eu-west-1a-k8s-infra-tova-sh.id]
  node_security_group_ids      = [aws_security_group.nodes-k8s-infra-tova-sh.id]
  node_subnet_ids              = [aws_subnet.eu-west-1a-k8s-infra-tova-sh.id]
  nodes_role_arn               = aws_iam_role.nodes-k8s-infra-tova-sh.arn
  nodes_role_name              = aws_iam_role.nodes-k8s-infra-tova-sh.name
  region                       = "eu-west-1"
  route_table_public_id        = aws_route_table.k8s-infra-tova-sh.id
  subnet_eu-west-1a_id         = aws_subnet.eu-west-1a-k8s-infra-tova-sh.id
  vpc_cidr_block               = aws_vpc.k8s-infra-tova-sh.cidr_block
  vpc_id                       = aws_vpc.k8s-infra-tova-sh.id
}

output "cluster_name" {
  value = "k8s.infra.tova.sh"
}

output "master_autoscaling_group_ids" {
  value = [aws_autoscaling_group.master-eu-west-1a-masters-k8s-infra-tova-sh.id]
}

output "master_security_group_ids" {
  value = [aws_security_group.masters-k8s-infra-tova-sh.id]
}

output "masters_role_arn" {
  value = aws_iam_role.masters-k8s-infra-tova-sh.arn
}

output "masters_role_name" {
  value = aws_iam_role.masters-k8s-infra-tova-sh.name
}

output "node_autoscaling_group_ids" {
  value = [aws_autoscaling_group.nodes-eu-west-1a-k8s-infra-tova-sh.id]
}

output "node_security_group_ids" {
  value = [aws_security_group.nodes-k8s-infra-tova-sh.id]
}

output "node_subnet_ids" {
  value = [aws_subnet.eu-west-1a-k8s-infra-tova-sh.id]
}

output "nodes_role_arn" {
  value = aws_iam_role.nodes-k8s-infra-tova-sh.arn
}

output "nodes_role_name" {
  value = aws_iam_role.nodes-k8s-infra-tova-sh.name
}

output "region" {
  value = "eu-west-1"
}

output "route_table_public_id" {
  value = aws_route_table.k8s-infra-tova-sh.id
}

output "subnet_eu-west-1a_id" {
  value = aws_subnet.eu-west-1a-k8s-infra-tova-sh.id
}

output "vpc_cidr_block" {
  value = aws_vpc.k8s-infra-tova-sh.cidr_block
}

output "vpc_id" {
  value = aws_vpc.k8s-infra-tova-sh.id
}

provider "aws" {
  region = "eu-west-1"
}

resource "aws_autoscaling_group" "master-eu-west-1a-masters-k8s-infra-tova-sh" {
  enabled_metrics = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
  launch_template {
    id      = aws_launch_template.master-eu-west-1a-masters-k8s-infra-tova-sh.id
    version = aws_launch_template.master-eu-west-1a-masters-k8s-infra-tova-sh.latest_version
  }
  max_size              = 1
  metrics_granularity   = "1Minute"
  min_size              = 1
  name                  = "master-eu-west-1a.masters.k8s.infra.tova.sh"
  protect_from_scale_in = false
  tag {
    key                 = "KubernetesCluster"
    propagate_at_launch = true
    value               = "k8s.infra.tova.sh"
  }
  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "master-eu-west-1a.masters.k8s.infra.tova.sh"
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"
    propagate_at_launch = true
    value               = "master-eu-west-1a"
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/kops-controller-pki"
    propagate_at_launch = true
    value               = ""
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"
    propagate_at_launch = true
    value               = "master"
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/control-plane"
    propagate_at_launch = true
    value               = ""
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/master"
    propagate_at_launch = true
    value               = ""
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/node.kubernetes.io/exclude-from-external-load-balancers"
    propagate_at_launch = true
    value               = ""
  }
  tag {
    key                 = "k8s.io/role/master"
    propagate_at_launch = true
    value               = "1"
  }
  tag {
    key                 = "kops.k8s.io/instancegroup"
    propagate_at_launch = true
    value               = "master-eu-west-1a"
  }
  tag {
    key                 = "kubernetes.io/cluster/k8s.infra.tova.sh"
    propagate_at_launch = true
    value               = "owned"
  }
  vpc_zone_identifier = [aws_subnet.eu-west-1a-k8s-infra-tova-sh.id]
}

resource "aws_autoscaling_group" "nodes-eu-west-1a-k8s-infra-tova-sh" {
  enabled_metrics = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
  launch_template {
    id      = aws_launch_template.nodes-eu-west-1a-k8s-infra-tova-sh.id
    version = aws_launch_template.nodes-eu-west-1a-k8s-infra-tova-sh.latest_version
  }
  max_size              = 1
  metrics_granularity   = "1Minute"
  min_size              = 1
  name                  = "nodes-eu-west-1a.k8s.infra.tova.sh"
  protect_from_scale_in = false
  tag {
    key                 = "KubernetesCluster"
    propagate_at_launch = true
    value               = "k8s.infra.tova.sh"
  }
  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "nodes-eu-west-1a.k8s.infra.tova.sh"
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"
    propagate_at_launch = true
    value               = "nodes-eu-west-1a"
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"
    propagate_at_launch = true
    value               = "node"
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node"
    propagate_at_launch = true
    value               = ""
  }
  tag {
    key                 = "k8s.io/role/node"
    propagate_at_launch = true
    value               = "1"
  }
  tag {
    key                 = "kops.k8s.io/instancegroup"
    propagate_at_launch = true
    value               = "nodes-eu-west-1a"
  }
  tag {
    key                 = "kubernetes.io/cluster/k8s.infra.tova.sh"
    propagate_at_launch = true
    value               = "owned"
  }
  vpc_zone_identifier = [aws_subnet.eu-west-1a-k8s-infra-tova-sh.id]
}

resource "aws_ebs_volume" "a-etcd-events-k8s-infra-tova-sh" {
  availability_zone = "eu-west-1a"
  encrypted         = true
  iops              = 3000
  size              = 20
  tags = {
    "KubernetesCluster"                       = "k8s.infra.tova.sh"
    "Name"                                    = "a.etcd-events.k8s.infra.tova.sh"
    "k8s.io/etcd/events"                      = "a/a"
    "k8s.io/role/master"                      = "1"
    "kubernetes.io/cluster/k8s.infra.tova.sh" = "owned"
  }
  throughput = 125
  type       = "gp3"
}

resource "aws_ebs_volume" "a-etcd-main-k8s-infra-tova-sh" {
  availability_zone = "eu-west-1a"
  encrypted         = true
  iops              = 3000
  size              = 20
  tags = {
    "KubernetesCluster"                       = "k8s.infra.tova.sh"
    "Name"                                    = "a.etcd-main.k8s.infra.tova.sh"
    "k8s.io/etcd/main"                        = "a/a"
    "k8s.io/role/master"                      = "1"
    "kubernetes.io/cluster/k8s.infra.tova.sh" = "owned"
  }
  throughput = 125
  type       = "gp3"
}

resource "aws_iam_instance_profile" "masters-k8s-infra-tova-sh" {
  name = "masters.k8s.infra.tova.sh"
  role = aws_iam_role.masters-k8s-infra-tova-sh.name
  tags = {
    "KubernetesCluster"                       = "k8s.infra.tova.sh"
    "Name"                                    = "masters.k8s.infra.tova.sh"
    "kubernetes.io/cluster/k8s.infra.tova.sh" = "owned"
  }
}

resource "aws_iam_instance_profile" "nodes-k8s-infra-tova-sh" {
  name = "nodes.k8s.infra.tova.sh"
  role = aws_iam_role.nodes-k8s-infra-tova-sh.name
  tags = {
    "KubernetesCluster"                       = "k8s.infra.tova.sh"
    "Name"                                    = "nodes.k8s.infra.tova.sh"
    "kubernetes.io/cluster/k8s.infra.tova.sh" = "owned"
  }
}

resource "aws_iam_role" "masters-k8s-infra-tova-sh" {
  assume_role_policy = file("${path.module}/data/aws_iam_role_masters.k8s.infra.tova.sh_policy")
  name               = "masters.k8s.infra.tova.sh"
  tags = {
    "KubernetesCluster"                       = "k8s.infra.tova.sh"
    "Name"                                    = "masters.k8s.infra.tova.sh"
    "kubernetes.io/cluster/k8s.infra.tova.sh" = "owned"
  }
}

resource "aws_iam_role" "nodes-k8s-infra-tova-sh" {
  assume_role_policy = file("${path.module}/data/aws_iam_role_nodes.k8s.infra.tova.sh_policy")
  name               = "nodes.k8s.infra.tova.sh"
  tags = {
    "KubernetesCluster"                       = "k8s.infra.tova.sh"
    "Name"                                    = "nodes.k8s.infra.tova.sh"
    "kubernetes.io/cluster/k8s.infra.tova.sh" = "owned"
  }
}

resource "aws_iam_role_policy" "masters-k8s-infra-tova-sh" {
  name   = "masters.k8s.infra.tova.sh"
  policy = file("${path.module}/data/aws_iam_role_policy_masters.k8s.infra.tova.sh_policy")
  role   = aws_iam_role.masters-k8s-infra-tova-sh.name
}

resource "aws_iam_role_policy" "nodes-k8s-infra-tova-sh" {
  name   = "nodes.k8s.infra.tova.sh"
  policy = file("${path.module}/data/aws_iam_role_policy_nodes.k8s.infra.tova.sh_policy")
  role   = aws_iam_role.nodes-k8s-infra-tova-sh.name
}

resource "aws_internet_gateway" "k8s-infra-tova-sh" {
  tags = {
    "KubernetesCluster"                       = "k8s.infra.tova.sh"
    "Name"                                    = "k8s.infra.tova.sh"
    "kubernetes.io/cluster/k8s.infra.tova.sh" = "owned"
  }
  vpc_id = aws_vpc.k8s-infra-tova-sh.id
}

resource "aws_key_pair" "kubernetes-k8s-infra-tova-sh-734d6cb299efa9a73da914be7e352f0d" {
  key_name   = "kubernetes.k8s.infra.tova.sh-73:4d:6c:b2:99:ef:a9:a7:3d:a9:14:be:7e:35:2f:0d"
  public_key = file("${path.module}/data/aws_key_pair_kubernetes.k8s.infra.tova.sh-734d6cb299efa9a73da914be7e352f0d_public_key")
  tags = {
    "KubernetesCluster"                       = "k8s.infra.tova.sh"
    "Name"                                    = "k8s.infra.tova.sh"
    "kubernetes.io/cluster/k8s.infra.tova.sh" = "owned"
  }
}

resource "aws_launch_template" "master-eu-west-1a-masters-k8s-infra-tova-sh" {
  block_device_mappings {
    device_name = "/dev/sda1"
    ebs {
      delete_on_termination = true
      encrypted             = true
      iops                  = 3000
      throughput            = 125
      volume_size           = 64
      volume_type           = "gp3"
    }
  }
  iam_instance_profile {
    name = aws_iam_instance_profile.masters-k8s-infra-tova-sh.id
  }
  image_id      = "ami-0298c9e0d2c86b0ed"
  instance_type = "t3a.small"
  key_name      = aws_key_pair.kubernetes-k8s-infra-tova-sh-734d6cb299efa9a73da914be7e352f0d.id
  lifecycle {
    create_before_destroy = true
  }
  metadata_options {
    http_endpoint               = "enabled"
    http_put_response_hop_limit = 1
    http_tokens                 = "optional"
  }
  monitoring {
    enabled = false
  }
  name = "master-eu-west-1a.masters.k8s.infra.tova.sh"
  network_interfaces {
    associate_public_ip_address = true
    delete_on_termination       = true
    security_groups             = [aws_security_group.masters-k8s-infra-tova-sh.id]
  }
  tag_specifications {
    resource_type = "instance"
    tags = {
      "KubernetesCluster"                                                                                     = "k8s.infra.tova.sh"
      "Name"                                                                                                  = "master-eu-west-1a.masters.k8s.infra.tova.sh"
      "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"                               = "master-eu-west-1a"
      "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/kops-controller-pki"                         = ""
      "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"                                      = "master"
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/control-plane"                   = ""
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/master"                          = ""
      "k8s.io/cluster-autoscaler/node-template/label/node.kubernetes.io/exclude-from-external-load-balancers" = ""
      "k8s.io/role/master"                                                                                    = "1"
      "kops.k8s.io/instancegroup"                                                                             = "master-eu-west-1a"
      "kubernetes.io/cluster/k8s.infra.tova.sh"                                                               = "owned"
    }
  }
  tag_specifications {
    resource_type = "volume"
    tags = {
      "KubernetesCluster"                                                                                     = "k8s.infra.tova.sh"
      "Name"                                                                                                  = "master-eu-west-1a.masters.k8s.infra.tova.sh"
      "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"                               = "master-eu-west-1a"
      "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/kops-controller-pki"                         = ""
      "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"                                      = "master"
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/control-plane"                   = ""
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/master"                          = ""
      "k8s.io/cluster-autoscaler/node-template/label/node.kubernetes.io/exclude-from-external-load-balancers" = ""
      "k8s.io/role/master"                                                                                    = "1"
      "kops.k8s.io/instancegroup"                                                                             = "master-eu-west-1a"
      "kubernetes.io/cluster/k8s.infra.tova.sh"                                                               = "owned"
    }
  }
  tags = {
    "KubernetesCluster"                                                                                     = "k8s.infra.tova.sh"
    "Name"                                                                                                  = "master-eu-west-1a.masters.k8s.infra.tova.sh"
    "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"                               = "master-eu-west-1a"
    "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/kops-controller-pki"                         = ""
    "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"                                      = "master"
    "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/control-plane"                   = ""
    "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/master"                          = ""
    "k8s.io/cluster-autoscaler/node-template/label/node.kubernetes.io/exclude-from-external-load-balancers" = ""
    "k8s.io/role/master"                                                                                    = "1"
    "kops.k8s.io/instancegroup"                                                                             = "master-eu-west-1a"
    "kubernetes.io/cluster/k8s.infra.tova.sh"                                                               = "owned"
  }
  user_data = filebase64("${path.module}/data/aws_launch_template_master-eu-west-1a.masters.k8s.infra.tova.sh_user_data")
}

resource "aws_launch_template" "nodes-eu-west-1a-k8s-infra-tova-sh" {
  block_device_mappings {
    device_name = "/dev/sda1"
    ebs {
      delete_on_termination = true
      encrypted             = true
      iops                  = 3000
      throughput            = 125
      volume_size           = 128
      volume_type           = "gp3"
    }
  }
  iam_instance_profile {
    name = aws_iam_instance_profile.nodes-k8s-infra-tova-sh.id
  }
  image_id      = "ami-0298c9e0d2c86b0ed"
  instance_type = "t3a.small"
  key_name      = aws_key_pair.kubernetes-k8s-infra-tova-sh-734d6cb299efa9a73da914be7e352f0d.id
  lifecycle {
    create_before_destroy = true
  }
  metadata_options {
    http_endpoint               = "enabled"
    http_put_response_hop_limit = 1
    http_tokens                 = "optional"
  }
  monitoring {
    enabled = false
  }
  name = "nodes-eu-west-1a.k8s.infra.tova.sh"
  network_interfaces {
    associate_public_ip_address = true
    delete_on_termination       = true
    security_groups             = [aws_security_group.nodes-k8s-infra-tova-sh.id]
  }
  tag_specifications {
    resource_type = "instance"
    tags = {
      "KubernetesCluster"                                                          = "k8s.infra.tova.sh"
      "Name"                                                                       = "nodes-eu-west-1a.k8s.infra.tova.sh"
      "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"    = "nodes-eu-west-1a"
      "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"           = "node"
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node" = ""
      "k8s.io/role/node"                                                           = "1"
      "kops.k8s.io/instancegroup"                                                  = "nodes-eu-west-1a"
      "kubernetes.io/cluster/k8s.infra.tova.sh"                                    = "owned"
    }
  }
  tag_specifications {
    resource_type = "volume"
    tags = {
      "KubernetesCluster"                                                          = "k8s.infra.tova.sh"
      "Name"                                                                       = "nodes-eu-west-1a.k8s.infra.tova.sh"
      "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"    = "nodes-eu-west-1a"
      "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"           = "node"
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node" = ""
      "k8s.io/role/node"                                                           = "1"
      "kops.k8s.io/instancegroup"                                                  = "nodes-eu-west-1a"
      "kubernetes.io/cluster/k8s.infra.tova.sh"                                    = "owned"
    }
  }
  tags = {
    "KubernetesCluster"                                                          = "k8s.infra.tova.sh"
    "Name"                                                                       = "nodes-eu-west-1a.k8s.infra.tova.sh"
    "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"    = "nodes-eu-west-1a"
    "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"           = "node"
    "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node" = ""
    "k8s.io/role/node"                                                           = "1"
    "kops.k8s.io/instancegroup"                                                  = "nodes-eu-west-1a"
    "kubernetes.io/cluster/k8s.infra.tova.sh"                                    = "owned"
  }
  user_data = filebase64("${path.module}/data/aws_launch_template_nodes-eu-west-1a.k8s.infra.tova.sh_user_data")
}

resource "aws_route" "route-0-0-0-0--0" {
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.k8s-infra-tova-sh.id
  route_table_id         = aws_route_table.k8s-infra-tova-sh.id
}

resource "aws_route_table" "k8s-infra-tova-sh" {
  tags = {
    "KubernetesCluster"                       = "k8s.infra.tova.sh"
    "Name"                                    = "k8s.infra.tova.sh"
    "kubernetes.io/cluster/k8s.infra.tova.sh" = "owned"
    "kubernetes.io/kops/role"                 = "public"
  }
  vpc_id = aws_vpc.k8s-infra-tova-sh.id
}

resource "aws_route_table_association" "eu-west-1a-k8s-infra-tova-sh" {
  route_table_id = aws_route_table.k8s-infra-tova-sh.id
  subnet_id      = aws_subnet.eu-west-1a-k8s-infra-tova-sh.id
}

resource "aws_security_group" "masters-k8s-infra-tova-sh" {
  description = "Security group for masters"
  name        = "masters.k8s.infra.tova.sh"
  tags = {
    "KubernetesCluster"                       = "k8s.infra.tova.sh"
    "Name"                                    = "masters.k8s.infra.tova.sh"
    "kubernetes.io/cluster/k8s.infra.tova.sh" = "owned"
  }
  vpc_id = aws_vpc.k8s-infra-tova-sh.id
}

resource "aws_security_group" "nodes-k8s-infra-tova-sh" {
  description = "Security group for nodes"
  name        = "nodes.k8s.infra.tova.sh"
  tags = {
    "KubernetesCluster"                       = "k8s.infra.tova.sh"
    "Name"                                    = "nodes.k8s.infra.tova.sh"
    "kubernetes.io/cluster/k8s.infra.tova.sh" = "owned"
  }
  vpc_id = aws_vpc.k8s-infra-tova-sh.id
}

resource "aws_security_group_rule" "from-0-0-0-0--0-ingress-tcp-22to22-masters-k8s-infra-tova-sh" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 22
  protocol          = "tcp"
  security_group_id = aws_security_group.masters-k8s-infra-tova-sh.id
  to_port           = 22
  type              = "ingress"
}

resource "aws_security_group_rule" "from-0-0-0-0--0-ingress-tcp-22to22-nodes-k8s-infra-tova-sh" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 22
  protocol          = "tcp"
  security_group_id = aws_security_group.nodes-k8s-infra-tova-sh.id
  to_port           = 22
  type              = "ingress"
}

resource "aws_security_group_rule" "from-0-0-0-0--0-ingress-tcp-443to443-masters-k8s-infra-tova-sh" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 443
  protocol          = "tcp"
  security_group_id = aws_security_group.masters-k8s-infra-tova-sh.id
  to_port           = 443
  type              = "ingress"
}

resource "aws_security_group_rule" "from-masters-k8s-infra-tova-sh-egress-all-0to0-0-0-0-0--0" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 0
  protocol          = "-1"
  security_group_id = aws_security_group.masters-k8s-infra-tova-sh.id
  to_port           = 0
  type              = "egress"
}

resource "aws_security_group_rule" "from-masters-k8s-infra-tova-sh-ingress-all-0to0-masters-k8s-infra-tova-sh" {
  from_port                = 0
  protocol                 = "-1"
  security_group_id        = aws_security_group.masters-k8s-infra-tova-sh.id
  source_security_group_id = aws_security_group.masters-k8s-infra-tova-sh.id
  to_port                  = 0
  type                     = "ingress"
}

resource "aws_security_group_rule" "from-masters-k8s-infra-tova-sh-ingress-all-0to0-nodes-k8s-infra-tova-sh" {
  from_port                = 0
  protocol                 = "-1"
  security_group_id        = aws_security_group.nodes-k8s-infra-tova-sh.id
  source_security_group_id = aws_security_group.masters-k8s-infra-tova-sh.id
  to_port                  = 0
  type                     = "ingress"
}

resource "aws_security_group_rule" "from-nodes-k8s-infra-tova-sh-egress-all-0to0-0-0-0-0--0" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 0
  protocol          = "-1"
  security_group_id = aws_security_group.nodes-k8s-infra-tova-sh.id
  to_port           = 0
  type              = "egress"
}

resource "aws_security_group_rule" "from-nodes-k8s-infra-tova-sh-ingress-all-0to0-nodes-k8s-infra-tova-sh" {
  from_port                = 0
  protocol                 = "-1"
  security_group_id        = aws_security_group.nodes-k8s-infra-tova-sh.id
  source_security_group_id = aws_security_group.nodes-k8s-infra-tova-sh.id
  to_port                  = 0
  type                     = "ingress"
}

resource "aws_security_group_rule" "from-nodes-k8s-infra-tova-sh-ingress-tcp-1to2379-masters-k8s-infra-tova-sh" {
  from_port                = 1
  protocol                 = "tcp"
  security_group_id        = aws_security_group.masters-k8s-infra-tova-sh.id
  source_security_group_id = aws_security_group.nodes-k8s-infra-tova-sh.id
  to_port                  = 2379
  type                     = "ingress"
}

resource "aws_security_group_rule" "from-nodes-k8s-infra-tova-sh-ingress-tcp-2382to4000-masters-k8s-infra-tova-sh" {
  from_port                = 2382
  protocol                 = "tcp"
  security_group_id        = aws_security_group.masters-k8s-infra-tova-sh.id
  source_security_group_id = aws_security_group.nodes-k8s-infra-tova-sh.id
  to_port                  = 4000
  type                     = "ingress"
}

resource "aws_security_group_rule" "from-nodes-k8s-infra-tova-sh-ingress-tcp-4003to65535-masters-k8s-infra-tova-sh" {
  from_port                = 4003
  protocol                 = "tcp"
  security_group_id        = aws_security_group.masters-k8s-infra-tova-sh.id
  source_security_group_id = aws_security_group.nodes-k8s-infra-tova-sh.id
  to_port                  = 65535
  type                     = "ingress"
}

resource "aws_security_group_rule" "from-nodes-k8s-infra-tova-sh-ingress-udp-1to65535-masters-k8s-infra-tova-sh" {
  from_port                = 1
  protocol                 = "udp"
  security_group_id        = aws_security_group.masters-k8s-infra-tova-sh.id
  source_security_group_id = aws_security_group.nodes-k8s-infra-tova-sh.id
  to_port                  = 65535
  type                     = "ingress"
}

resource "aws_subnet" "eu-west-1a-k8s-infra-tova-sh" {
  availability_zone = "eu-west-1a"
  cidr_block        = "172.20.32.0/19"
  tags = {
    "KubernetesCluster"                       = "k8s.infra.tova.sh"
    "Name"                                    = "eu-west-1a.k8s.infra.tova.sh"
    "SubnetType"                              = "Public"
    "kubernetes.io/cluster/k8s.infra.tova.sh" = "owned"
    "kubernetes.io/role/elb"                  = "1"
    "kubernetes.io/role/internal-elb"         = "1"
  }
  vpc_id = aws_vpc.k8s-infra-tova-sh.id
}

resource "aws_vpc" "k8s-infra-tova-sh" {
  cidr_block           = "172.20.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    "KubernetesCluster"                       = "k8s.infra.tova.sh"
    "Name"                                    = "k8s.infra.tova.sh"
    "kubernetes.io/cluster/k8s.infra.tova.sh" = "owned"
  }
}

resource "aws_vpc_dhcp_options" "k8s-infra-tova-sh" {
  domain_name         = "eu-west-1.compute.internal"
  domain_name_servers = ["AmazonProvidedDNS"]
  tags = {
    "KubernetesCluster"                       = "k8s.infra.tova.sh"
    "Name"                                    = "k8s.infra.tova.sh"
    "kubernetes.io/cluster/k8s.infra.tova.sh" = "owned"
  }
}

resource "aws_vpc_dhcp_options_association" "k8s-infra-tova-sh" {
  dhcp_options_id = aws_vpc_dhcp_options.k8s-infra-tova-sh.id
  vpc_id          = aws_vpc.k8s-infra-tova-sh.id
}

terraform {
  required_version = ">= 0.12.26"
  required_providers {
    aws = {
      "source"  = "hashicorp/aws"
      "version" = ">= 3.34.0"
    }
  }
}
