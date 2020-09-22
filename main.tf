resource "aws_elasticache_cluster" "cache" {
    count   = var.create ? 1 : 0

    cluster_id              = lower(replace(var.name, " ", "-"))
    engine                  = var.engine
    engine_version          = var.engine_version
    node_type               = var.node_type
    parameter_group_name    = var.parameter_group_name
    maintenance_window      = var.maintenance_window
    subnet_group_name       = aws_elasticache_subnet_group.cache.0.name
    security_group_ids      = var.security_group_ids
    port                    = var.port
    num_cache_nodes         = var.num_cache_nodes
    az_mode                 = var.az_mode

    tags = merge(
        {
            Name    = var.name
        },
        "${var.default_tags}"
    )   
}

resource "aws_elasticache_subnet_group" "cache" {
    count = var.create ? length(var.cache_subnet_group) : 0

    name       = lookup(var.cache_subnet_group[count.index], "name", null)
    subnet_ids = lookup(var.cache_subnet_group[count.index], "subnet_ids", null)

    tags = merge(
        {
            "Name" = "${format("%s", var.name)}-Subnet-Group"
        },
        var.default_tags,
    )
}
#resource "aws_elasticache_security_group" "main" {
#    count = var.create ? 1 : 0
#
#    name                 = "${var.name}-security-group"
#    security_group_names = var.security_group_names
#}




