resource "aws_iam_role_policy_attachment" "brnck-cluster-AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.brnck-cluster.name
}

resource "aws_iam_role_policy_attachment" "brnck-cluster-AmazonEKSServicePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
  role       = aws_iam_role.brnck-cluster.name
}

resource "aws_iam_role_policy_attachment" "brnck-node-AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.brnck-node.name
}

resource "aws_iam_role_policy_attachment" "brnck-node-AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.brnck-node.name
}

resource "aws_iam_role_policy_attachment" "brnck-node-AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.brnck-node.name
}
