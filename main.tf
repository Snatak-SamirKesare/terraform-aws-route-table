resource "aws_route_table" "route_table" {
  count = var.enable_protected_subnet == true ? 1 : 0

  vpc_id = var.vpc_id
  route {
    cidr_block = var.cidr
    gateway_id = var.gateway_id
  }

  tags = merge(
    {
      "Name" = format("%s-rt", var.name)
    },
    var.tags,
  )
}
