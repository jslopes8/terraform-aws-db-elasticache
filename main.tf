resource "aws_elasticache_cluster" "cache" {
    count   = var.create ? 1 : 0

    cluster_id            = "${var.cluster_id}"
    engine                = "${var.engine}"
    engine_version        = "${var.engine_version}"
    node_type             = "${var.node_type}"
    parameter_group_name  = "${var.parameter_group_name}"
    maintenance_window    = "${var.maintenance_window}"
    subnet_group_name     = "${aws_elasticache_subnet_group.cache.name}"
    security_group_ids    = "${var.security_group_ids}"
    port                  = "${var.port}"
    num_cache_nodes       = "${var.num_cache_nodes}"

    tags = merge(
        {
            Name    = "${var.name}"
        },
        "${var.default_tags}"
    )
}

resource "aws_elasticache_subnet_group" "cache" {
    name       = "${var.name}-CacheSubnetGroup"
    subnet_ids = "${var.subnet_ids}"
}





