
output "endpoint" {
    value   = aws_elasticache_cluster.main.0.cache_nodes.0.address
}
